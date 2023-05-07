# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Yann Leprince <yann dot leprince at ylep dot fr>
pkgname=blitz
pkgver=1.0.2
pkgrel=2
pkgdesc="C++ Class library for scientific computing"
arch=('x86_64')
url="https://github.com/blitzpp/${pkgname}"
# The user is free to choose the license among ('Artistic2.0' 'BSD' 'LGPL3'),
# but we cannot express it here so we only mention the most permissive.
license=('custom:Artistic')
depends=(boost)
makedepends=(cmake python onetbb)
conflicts=(blitz-cppqed-hg)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('e5d82317c938d5dd2b0e6f99bc7dbcc982210f0f45961a21f4437466f01edbddafa01b92b3ccba707b0e01af697dc042846418011440b3574700afdf2bb08b47')

build() {
  cmake \
    -S ${pkgname}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib \
    -DBUILD_SHARED_LIBS=TRUE \
    -DBUILD_DOC=FALSE \
    -DBUILD_TESTING=TRUE \
    -DENABLE_SERIALISATION=TRUE \
    -DSIMD_EXTENSION=TRUE \
    -DTBB=TRUE
  cmake --build build --target lib
}

check() {
  cmake --build build --target testsuite benchmark examples
  ctest --test-dir build
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 ${pkgname}-${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
