# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

_pkgname=python-xeddsa
_pkgname2=python2-xeddsa
pkgbase=${_pkgname}-git
pkgname=("${_pkgname}-git" "${_pkgname2}-git" "${_pkgname}-ref10-git")
pkgver=r37.d0f7eef
pkgrel=3
pkgdesc="A python implementation of the XEdDSA signature scheme"
url='https://github.com/Syndace/python-xeddsa'
license=('MIT')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools' 'libsodium')
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

package_python-xeddsa-ref10-git() {
    cd ${_pkgname}
    install -m755 -d "${pkgdir}/usr/lib"
    install -Dm 644 \
      ref10/bin/dynamic/libcrypto_scalarmult.so \
      ref10/bin/dynamic/libcrypto_sign.so \
      "${pkgdir}/usr/lib"
}

package_python-xeddsa-git() {
    depends=('python-pynacl' 'python-xeddsa-ref10-git')
    provides=("${_pkgname}")
    conflicts=("${_pkgname}")

    cd ${_pkgname}

    python3 setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-xeddsa-git() {
    depends=('python2-pynacl' 'python-xeddsa-ref10-git')
    provides=("${_pkgname2}")
    conflicts=("${_pkgname2}")

    cd ${_pkgname}

    python2 setup.py install --root="${pkgdir}" --optimize=1
}
