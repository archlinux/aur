# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=avif-git
pkgver=0.7.3.r87.gba1eb49
pkgrel=1
pkgdesc="Library for encoding and decoding .avif files"
arch=('i686' 'x86_64')
url="https://github.com/AOMediaCodec/libavif"
license=('BSD')
depends=('glibc' 'dav1d' 'libjpeg' 'rav1e')
makedepends=('git' 'cmake' 'nasm' 'gdk-pixbuf2' 'pkgconf')
provides=('avif')
conflicts=('avif')
source=("git+https://github.com/AOMediaCodec/libavif.git")
sha256sums=('SKIP')


pkgver() {
  cd "libavif"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libavif"

  mkdir -p "_build" && cd "_build"
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DAVIF_BUILD_APPS=ON \
    -DAVIF_CODEC_DAV1D=ON \
    -DAVIF_CODEC_RAV1E=ON \
    -DAVIF_BUILD_GDK_PIXBUF=ON \
    ../
  make
}

package() {
  cd "libavif"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/avif"
}
