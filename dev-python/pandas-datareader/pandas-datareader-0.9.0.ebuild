# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="Pandas DataFrame extraction from a wide range of Internet sources"
HOMEPAGE="https://github.com/pydata/pandas-datareader"
SRC_URI="https://github.com/pydata/pandas-datareader/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="doc"

# Test suite depends on outbound network connectivity and is unstable
# https://github.com/pydata/pandas-datareader/issues/586
RESTRICT="test"

RDEPEND="
    >=dev-python/pandas-0.23.0[${PYTHON_USEDEP}]
    dev-python/lxml[${PYTHON_USEDEP}]
	>=dev-python/requests-2.19.0[${PYTHON_USEDEP}]
	dev-python/wrapt[${PYTHON_USEDEP}]
	doc? (
        dev-python/matplotlib[${PYTHON_USEDEP}]
		dev-python/ipython[${PYTHON_USEDEP}]
	)
"

distutils_enable_sphinx docs dev-python/sphinx_rtd_theme
distutils_enable_tests pytest