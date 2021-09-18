# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libwebp2-git
pkgver=r301.g257376e
pkgrel=1
pkgdesc="Successor of the WebP image format"
arch=('i686' 'x86_64')
url="https://chromium.googlesource.com/codecs/libwebp2/"
license=('apache')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=('libwebp2' 'libwebp2.so')
conflicts=('libwebp2')
source=("git+https://chromium.googlesource.com/codecs/libwebp2")
sha256sums=('SKIP')


prepare() {
  cd "libwebp2"

  sed -i 's/-Werror//' "cmake/compiler.cmake"
}

pkgver() {
  cd "libwebp2"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "libwebp2"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DBUILD_SHARED_LIBS=ON \
    ./
  make -C "_build"
}

check() {
  cd "libwebp2"

  #make -C "_build" test
}

package() {
  cd "libwebp2"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "_build/libimageio.so" -t "$pkgdir/usr/lib"
}
