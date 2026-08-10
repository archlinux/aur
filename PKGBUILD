# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=pyscrypt
pkgname="python-${_pkgname}"
pkgver=1.6.2
pkgrel=1
pkgdesc="Pure-Python Implementation of the scrypt password-based key derivation function and scrypt file format library"
arch=('any')
url="https://github.com/ricmoo/${_pkgname}"
license=('MIT')
depends=("python")
makedepends=("python-build" "python-installer" "python-setuptools")
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('70c79f5879a7bad661e6b71956d6e25da54bb372b53f2d91d1d3a2262b7b4d63')

prepare() {
    cd "${_pkgname}-${pkgver}"
    sed -i 's|raise StopIteration()|return|' pyscrypt/file.py
}

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_pkgname}-${pkgver}"
    python tests/run-tests-file.py
    python tests/run-tests-hash.py
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
