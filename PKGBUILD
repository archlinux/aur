# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gd-git
pkgver=2.3.3.r119.g2be005f3
pkgrel=1
pkgdesc="A library for the dynamic creation of images"
arch=('i686' 'x86_64')
url="https://libgd.github.io/"
license=('LicenseRef-gd')
depends=('glibc' 'fontconfig' 'freetype2' 'libavif' 'libheif' 'libimagequant' 'libjpeg' 'libpng' 'libtiff' 'libwebp' 'libxpm')
makedepends=('git' 'cmake')
optdepends=('perl: bdftogd script')
provides=("gd=$pkgver")
conflicts=('gd')
options=('staticlibs')
source=("git+https://github.com/libgd/libgd.git")
sha256sums=('SKIP')


pkgver() {
  cd "libgd"

  _tag=$(git tag -l --sort -v:refname | grep -E '^gd-[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^gd-//'
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
  cmake --build "_build"
}

package() {
  cd "libgd"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/gd"
}
