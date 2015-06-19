# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=carve
pkgver=1.4.0
pkgrel=2
pkgdesc="Fast, robust constructive solid geometry library"
arch=('i686' 'x86_64')
url="http://code.google.com/p/carve/"
license=('GPL')
depends=('gcc-libs')
makedepends=('boost' 'cmake' 'freeglut')
optdepends=('freeglut: carve-view')
source=("http://${pkgname}.googlecode.com/files/${pkgname}-${pkgver}.tgz"
        "boost.patch"
        "rng.patch")
md5sums=('5c3ea3b80e94adc549611f80e729acc9'
         '126433e01f1eeef41a7b1b5e9c0207df'
         'b2f407c6d8e1fbc9d436a1fef4f611e3')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/boost.patch"
  patch -Np1 -i "${srcdir}/rng.patch"
  [[ -d build ]] && rm -r build
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m644 include/carve/gnu_cxx.h "${pkgdir}/usr/include/carve/gnu_cxx.h"
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  install -D -m644 include/carve/config.h "${pkgdir}/usr/include/carve/config.h"
  rmdir "${pkgdir}/usr/include/carve/external"
  for x in convert intersect triangulate view; do
    mv "${pkgdir}/usr/bin/${x}" "${pkgdir}/usr/bin/${pkgname}-$x"
  done
}

# vim:set ts=2 sw=2 et:
