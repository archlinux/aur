# Maintainer:  <gucong@gc-desktop>
pkgname=ospray
pkgver=1.0.0
pkgrel=1
pkgdesc="A Ray Tracing Based Rendering Engine for High-Fidelity Visualization"
arch=('i686' 'x86_64')
url="http://www.ospray.org/"
license=('Apache')
depends=('qt4>=4.6' 'ispc' 'intel-tbb')
makedepends=('cmake')
source=(https://github.com/ospray/OSPRay/archive/v$pkgver.tar.gz
       patch)
md5sums=('faf022e6448f4bc750055d2c28847fb7'
         'a14f2a7da967fe078cf1b6aeb7beb961')

prepare() {
  cd "$srcdir"

  patch -p0 -N < patch

  [[ -d ${pkgname}-build ]] && rm -r ${pkgname}-build
  mkdir ${pkgname}-build
}

build() {
  cd "$srcdir/${pkgname}-build"

  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        ../OSPRay-$pkgver
  make
}

package() {
  cd "$srcdir/${pkgname}-build"

  make DESTDIR="$pkgdir" install

  mv $pkgdir/usr/lib{64,}

  rm $pkgdir/usr/lib/libtbb.so.2
  rm $pkgdir/usr/lib/libtbbmalloc.so.2
}

# vim:set ts=2 sw=2 et:
