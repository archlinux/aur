# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gd-git
pkgver=2.3.2.r234.g1b3f6fbe
pkgrel=1
pkgdesc="A library for the dynamic creation of images"
arch=('i686' 'x86_64')
url="https://libgd.github.io/"
license=('custom')
depends=('glibc' 'fontconfig' 'freetype2' 'libavif' 'libheif' 'libimagequant' 'libjpeg' 'libpng' 'libtiff' 'libwebp' 'libxpm')
makedepends=('git' 'cmake')
optdepends=('perl: bdftogd script')
provides=('gd')
conflicts=('gd')
options=('staticlibs')
source=("git+https://github.com/libgd/libgd.git")
sha256sums=('SKIP')


pkgver() {
  cd "libgd"

  git describe --long --tags | sed 's/^gd-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libgd"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DBUILD_STATIC_LIBS=ON \
    -DENABLE_FONTCONFIG=ON \
    -DENABLE_FREETYPE=ON \
    -DENABLE_GD_FORMATS=ON \
    -DENABLE_HEIF=ON \
    -DENABLE_JPEG=ON \
    -DENABLE_LIQ=ON \
    -DENABLE_PNG=ON \
    -DENABLE_TIFF=ON \
    -DENABLE_WEBP=ON \
    -DENABLE_XPM=ON \
    ./
  make -C "_build"
}

package() {
  cd "libgd"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/gd"
}
