# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=python-pandarm
_name=${pkgname#python-}
pkgdesc="Python library for network analysis that uses contraction hierarchies."
url="https://oturns.github.io/pandarm/"

pkgver=0.0.5
pkgrel=1

arch=("any")
license=("AGPL-3.0-only")

makedepends=(
    #"clang"
    "python-build"
    "python-installer"
    "python-setuptools-scm"
    "python-wheel"
)
depends=(
    "cython"
    "python"
    "python-geopandas"
    "python-narwhals"
    "python-numpy"
    "python-pandas"
    "python-pytables"
    "python-scikit-learn"
)
optdepends=(
    "python-osmnx"
)
checkdepends=(
    "${optdepends[@]}"
    "python-pytest"
    "python-pytest-cov"
)

source=( "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=("deacb24ab390c46d3cdfa779d72041451534d601fc7f7e8741b4493cb4bdfaa9b011cca22a5d1d5c3452b3b5aa2352bf6c42414985b6eb7da27e8af541b46880")

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}"/${_name}-${pkgver}

    local TEST_VENV="${srcdir}/test-venv"
    python -m venv --system-site-packages "${TEST_VENV}"
    "${TEST_VENV}"/bin/python -m installer dist/*.whl

    "${TEST_VENV}"/bin/python -P -m pytest
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
