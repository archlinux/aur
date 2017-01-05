# Maintainer:  <gucong43216@gmail.com>

pkgname=ospray
pkgver=1.1.2
pkgrel=4
pkgdesc="A Ray Tracing Based Rendering Engine for High-Fidelity Visualization"
arch=('i686' 'x86_64')
url="http://www.ospray.org/"
license=('Apache')
depends=('qt4>=4.6' 'ispc' 'intel-tbb' 'embree-isa' 'freeglut' 'glu' 'imagemagick')
makedepends=('cmake')
source=("https://github.com/ospray/OSPRay/archive/v$pkgver.tar.gz")
md5sums=('9cd174cac9c0b8509b44bf4d465f87ad')


prepare() {
  cd "$srcdir"

  [[ -d ${pkgname}-build ]] && rm -r ${pkgname}-build
  mkdir ${pkgname}-build
}

build() {
  cd "$srcdir/${pkgname}-build"

  export embree_DIR=/usr

  # MAX_ISA is detected in aur/embree-isa in build-time
  # Building may fail with community/embree
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DOSPRAY_USE_EXTERNAL_EMBREE:BOOL=ON \
        -DUSE_IMAGE_MAGICK:BOOL=ON \
        ../OSPRay-$pkgver
  make
}

package() {
  cd "$srcdir/${pkgname}-build"

  make DESTDIR="$pkgdir" install

  rm -f $pkgdir/usr/lib/libtbb*
  rm -f $pkgdir/usr/lib/libembree*
}

# vim:set ts=2 sw=2 et:
