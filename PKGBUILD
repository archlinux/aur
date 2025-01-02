# Maintainer: Damian Höster <damian dot hoester at posteo dot de>

_pkgname=zimtohrli
pkgname=${_pkgname}-git
pkgver=0.1.10.r65.8b64aaf
pkgrel=1
pkgdesc='A psychoacoustic perceptual metric for audio compression'
arch=(x86_64)
url=https://github.com/google/zimtohrli
license=(Apache-2.0)
depends=(
  glfw
  alsa-lib
)
makedepends=(
  cmake
  pkgconf
  python
  ninja
  clang
  llvm
)
optdepends=(
  flac
  libvorbis
  opus
  mpg123
)
provides=($_pkgname)
conflicts=($_pkgname)
source=($_pkgname::git+$url.git)
sha256sums=(SKIP)

pkgver() {
  git -C $_pkgname describe --long --tags | \
    sed -E 's/^v//; s/-([^-]*)-g([^-]*)$/-r\1.\2/; s/-/./g'
}

build() {
  cmake -S $_pkgname -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_FLAGS="$CFLAGS -fPIC" \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -fPIC" \
    -DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS"
  rm -f $_pkgname/go/goohrli/goorhli.a && ninja -C build "$NINJAFLAGS"
}

package() {
  install -Dm755 build/compare "$pkgdir/usr/bin/zimtohrli_compare"

  install -dm755 "$pkgdir/usr/share/licenses/$_pkgname/"
  install -Dm644 $_pkgname/LICENSE "$pkgdir/usr/share/licenses/$_pkgname/"
}
