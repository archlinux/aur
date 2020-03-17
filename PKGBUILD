# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

_pkgname=python-xeddsa
pkgbase=${_pkgname}-git
pkgname=${pkgbase}
pkgver=r75.5b6b93b
pkgrel=1
pkgdesc="A python implementation of the XEdDSA signature scheme"
url='https://github.com/Syndace/python-xeddsa'
license=('MIT')
arch=('any')
makedepends=('git' 'python-setuptools' 'cmake' 'libsodium')
depends=('glibc' 'python-libnacl')
source=("${_pkgname}::git+https://github.com/Syndace/python-xeddsa.git")
sha256sums=('SKIP')
conflicts=(${_pkgname})
provides=(${_pkgname})

pkgver() {
    cd ${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${_pkgname}
    python3 setup.py build

    cd ref10
    mkdir -p build && cd build
    cmake ..
}

package() {
    cd ${_pkgname}
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build

    install -m755 -d "${pkgdir}/usr/lib"
    install -Dm 644 \
      ref10/bin/libcrypto_scalarmult_dynamic.so \
      ref10/bin/libcrypto_sign_dynamic.so \
      "${pkgdir}/usr/lib"
}
