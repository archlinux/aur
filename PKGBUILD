# Maintainer:
# Contributor: Frederic Bezies <fredbezies at gmail dot com>

_pkgname="woof-doom"
pkgname="$_pkgname-git"
pkgver=15.2.0.r444.g3b083e7
pkgrel=2
pkgdesc="Doom port remaining faithful to Lee Killough's MBF on DOS"
arch=("x86_64")
url="https://github.com/fabiangreffrath/woof"
license=('GPL-2.0-or-later')

depends=(
  'hicolor-icon-theme'
  'libebur128'
  'libsndfile'
  'openal'
  'sdl3'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
  'python'
)
optdepends=(
  'fluidsynth'
  'libxmp'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --match='woof_*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
