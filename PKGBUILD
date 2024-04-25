# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libavif-git
pkgver=1.0.4.r476.gf56a1f18
pkgrel=1
pkgdesc="Library for encoding and decoding .avif files"
arch=('i686' 'x86_64')
url="https://github.com/AOMediaCodec/libavif"
license=('BSD-2-Clause')
depends=('glibc' 'aom' 'dav1d' 'libjpeg' 'libpng' 'librav1e.so' 'libsharpyuv.so' 'libyuv' 'svt-av1')
makedepends=('git' 'cmake' 'nasm' 'pkgconf' 'gdk-pixbuf2')
provides=("libavif=$pkgver")
conflicts=('libavif')
source=("git+https://github.com/AOMediaCodec/libavif.git")
sha256sums=('SKIP')


pkgver() {
  cd "libavif"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "libavif"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DAVIF_BUILD_APPS=ON \
    -DAVIF_BUILD_GDK_PIXBUF=ON \
    -DAVIF_CODEC_AOM=SYSTEM \
    -DAVIF_CODEC_DAV1D=SYSTEM \
    -DAVIF_CODEC_RAV1E=SYSTEM \
    -DAVIF_CODEC_SVT=SYSTEM \
    -DAVIF_LIBSHARPYUV=SYSTEM \
    ./
  cmake --build "_build"
}

package() {
  cd "libavif"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/libavif"
}
