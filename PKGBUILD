# Maintainer: Damian Höster <damian dot hoester at posteo dot de>

_pkgname=zimtohrli
pkgname=$_pkgname-git
pkgver=0.1.10.r79.9cbb55a
pkgrel=1
pkgdesc='A psychoacoustic perceptual metric for audio compression'
arch=(x86_64)
url=https://github.com/google/zimtohrli
license=(Apache-2.0)
depends=(
  glfw
  alsa-lib
  flac
  libvorbis
  opus
  mpg123
)
makedepends=(
  cmake
  pkgconf
  python
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
  cmake -S $_pkgname -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release
  rm -f $_pkgname/go/goohrli/goorhli.a
  ninja -C build
}

package() {
  install -Dvm755 build/compare "$pkgdir/usr/bin/zimtohrli_compare"
  install -Dvm644 $_pkgname/LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}
