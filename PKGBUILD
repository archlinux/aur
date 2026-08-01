# Maintainer: Damian Höster <damian.hoester@posteo.de>

_pkgname=zimtohrli
pkgname=$_pkgname-git
pkgver=0.2.1.r46.67c28b1
pkgrel=1
pkgdesc='A psychoacoustic perceptual metric for audio compression'
arch=(x86_64)
url=https://github.com/google/zimtohrli
license=(Apache-2.0)
depends=(
  libogg
  libvorbis
  flac
  opus
  alsa-lib
  glfw
  libsoxr
  mpg123
  lame
)
makedepends=(
  cmake
  pkgconf
  python
  clang
  xxd
  ninja
)
provides=($_pkgname)
conflicts=($_pkgname)
source=($_pkgname::git+$url.git)
sha256sums=(SKIP)

pkgver() {
  git -C $_pkgname describe --long --tags |
    sed -E 's/^v//; s/-([^-]*)-g([^-]*)$/.r\1.\2/; s/-/./g'
}

prepare() {
  sed -i '/CMAKE_CXX_CLANG_TIDY/d' "$_pkgname/CMakeLists.txt"
  echo "add_compile_options(-Wno-c2y-extensions -Wno-error=c2y-extensions)" \
    >>"$_pkgname/CMakeLists.txt"
}

build() {
  cmake -S $_pkgname -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -G Ninja
  rm -f $_pkgname/go/goohrli/goorhli.a
  ninja -C build $NINJAFLAGS
}

package() {
  install -Dvm755 build/compare "$pkgdir/usr/bin/zimtohrli_compare"
  install -Dm644 $_pkgname/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
