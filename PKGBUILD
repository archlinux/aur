# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-galois
_name=${pkgname#python-}
pkgver=0.3.8
pkgrel=1
pkgdesc="A performant NumPy extension for Galois fields and their applications"
arch=('any')
url="https://github.com/mhostetter/galois"
license=('MIT')
depends=(
    'python-numpy'
    'python-numba'
    'python-typing_extensions'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools-scm'
    'python-wheel'
)
checkdepends=(
    'python-pytest'
    'python-pytest-benchmark'
)
source=("${_name}-${pkgver}.tar.gz::https://github.com/mhostetter/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('1cca7b1a55cef1c8552e4d3ef9901b70fea357a201b8157569222a1f18aeca93a8bd6b6e2c4b361a219858a1cdf105bdff24d9a37ebccc0007a2c0f0a13f28ef')

build() {
    cd "${_name}-${pkgver}"
    export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
    python -m build --wheel --no-isolation
}

check() {
    local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    cd "${_name}-${pkgver}"
    python -m installer --destdir=test_dir dist/*.whl
    PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH" pytest
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
