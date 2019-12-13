# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

_tag=v0.5.0-beta
pkgname=python-xeddsa
pkgver=0.5.0.beta
pkgrel=2
pkgdesc="A python implementation of the XEdDSA signature scheme"
url='https://github.com/Syndace/python-xeddsa'
license=('MIT')
arch=('x86_64')
makedepends=('git' 'python-setuptools' 'cmake' 'libsodium')
source=("${pkgname}::git+https://github.com/Syndace/python-xeddsa.git#tag=${_tag}")
sha256sums=('SKIP')
depends=('glibc' 'python-pynacl')
provides=("${pkgname}")
conflicts=("${pkgname}")

pkgver() {
    cd ${pkgname}
    printf "%s" "$(git describe --tags | sed -e 's/^v//;s/-/./')"
}

build() {
    cd ${pkgname}
    python3 setup.py build

    cd ref10
    mkdir -p build && cd build
    cmake ..
}

package() {
    cd ${pkgname}
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build

    install -m755 -d "${pkgdir}/usr/lib"
    install -Dm 644 \
      ref10/bin/libcrypto_scalarmult_dynamic.so \
      ref10/bin/libcrypto_sign_dynamic.so \
      "${pkgdir}/usr/lib"
}
