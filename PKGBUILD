# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

_pkgname=python-xeddsa
pkgname=${_pkgname}-git
pkgver=r19.4872d92
pkgrel=1
pkgdesc="A python implementation of the XEdDSA signature scheme"
url='https://github.com/Syndace/python-xeddsa'
license=('MIT')
arch=('any')
depends=('python-pynacl')
makedepends=('python-setuptools' 'libsodium')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/Syndace/python-xeddsa.git")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${_pkgname}/ref10"
    sed -i -e 's,usr/local/include,usr/include,' Makefile
}

build() {
    cd "${_pkgname}/ref10"
    make
}

package() {
    cd ${_pkgname}

    python3 setup.py install --root="${pkgdir}" --optimize=1
    install -Dm 644 ref10/bin/crypto_scalarmult.so ref10/bin/crypto_sign.so \
      "${pkgdir}/usr/lib"
}
