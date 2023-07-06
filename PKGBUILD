# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-liboqs
_name=liboqs-python
pkgver=0.8.0
pkgrel=2
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
b2sums=('09789298b715482d6a91ec6e7f414a0efee3a89210b79b82b886e50a5c21cae381a60c4dc7a50acae7a35d86ef1cd7a400f65b3ea73f24ff766e0a6078fbe49d')

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
