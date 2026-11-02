# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=python-pandarm
_name=${pkgname#python-}
pkgdesc="Python library for network analysis that uses contraction hierarchies."
url="https://oturns.github.io/pandarm/"

pkgver=0.0.7.post1
pkgrel=1

arch=("x86_64")
license=("AGPL-3.0-only")

makedepends=(
    "nanobind"
    "python-build"
    "python-installer"
    "python-scikit-build-core"
    "python-setuptools-scm"
    "python-wheel"
)
depends=(
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

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=("40c1d699fd83d5bab4eb48805888afc6a1cc2549e88f963eb98bd28094f9d471aedc6ac74e78c676ca28f6164c003208ce54cb414ac4a9b6ca607a5bb389714d")

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
