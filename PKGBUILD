# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

_pkgname=python-xeddsa
_pkgname2=python2-xeddsa
_tag=v0.4.6-beta
pkgbase=${_pkgname}
pkgname=("${_pkgname}" "${_pkgname2}" "${_pkgname}-ref10")
pkgver=0.4.6.beta
pkgrel=1
pkgdesc="A python implementation of the XEdDSA signature scheme"
url='https://github.com/Syndace/python-xeddsa'
license=('MIT')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools' 'cmake' 'libsodium')
source=("${_pkgname}::git+https://github.com/Syndace/python-xeddsa.git#tag=${tag}")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    printf "%s" "$(git describe --tags | sed -e 's/^v//;s/-/./')"
}

build() {
    cd "${_pkgname}/ref10"
    mkdir -p build && cd build
    cmake ..
}

package_python-xeddsa-ref10() {
    cd ${_pkgname}
    install -m755 -d "${pkgdir}/usr/lib"
    install -Dm 644 \
      ref10/bin/libcrypto_scalarmult_dynamic.so \
      ref10/bin/libcrypto_sign_dynamic.so \
      "${pkgdir}/usr/lib"
}

package_python-xeddsa() {
    depends=('python-pynacl' 'python-xeddsa-ref10')
    provides=("${_pkgname}")
    conflicts=("${_pkgname}")

    cd ${_pkgname}

    python3 setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-xeddsa() {
    depends=('python2-pynacl' 'python-xeddsa-ref10')
    provides=("${_pkgname2}")
    conflicts=("${_pkgname2}")

    cd ${_pkgname}

    python2 setup.py install --root="${pkgdir}" --optimize=1
}
