# Maintainer: Damian Höster <damian dot hoester at posteo dot de>

_pkgname=zimtohrli
pkgname=$_pkgname-git
pkgver=0.2.1.r37.ecb24ec
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
  git -C $_pkgname describe --long --tags | \
    sed -E 's/^v//; s/-([^-]*)-g([^-]*)$/-r\1.\2/; s/-/./g'
}

build() {
  export CFLAGS+=' -fPIC' CXXFLAGS+=' -fPIC'
  cmake -S $_pkgname -B build \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_BUILD_TYPE=Release \
    -G Ninja
  rm -f $_pkgname/go/goohrli/goorhli.a
  ninja -C build
}

package() {
  install -Dvm755 build/compare "$pkgdir/usr/bin/zimtohrli_compare"
  install -Dm644 $_pkgname/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
