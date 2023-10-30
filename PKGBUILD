# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-liboqs
_name=liboqs-python
pkgver=0.9.0
pkgrel=1
pkgdesc="Python 3 bindings for liboqs"
arch=('any')
url="https://github.com/open-quantum-safe/liboqs-python"
license=('MIT')
depends=('liboqs')
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=('python-nose2')
source=("${_name}-${pkgver}.tar.gz::https://github.com/open-quantum-safe/$_name/archive/refs/tags/$pkgver.tar.gz")
b2sums=('a894c6c6ab95485d951441268ffa2be02f0768183fb7bd5c24c0026a326a7a227a2b25552ad9b1b5c6a1b3dcc3802fd0e618508205be8edad8b08b0a6f18dc69')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$srcdir/test" dist/*.whl
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    export PYTHONPATH="$srcdir"/test/usr/lib/python${python_version}/site-packages
    python -m nose2 --verbose
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
