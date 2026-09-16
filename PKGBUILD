# Maintainer:
# Contributor: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: aimileus < me at aimileus dot nl >

_pkgname="nestopia"
pkgname="$_pkgname-git"
pkgver=2.0.0.r0.g2724614
pkgrel=1
pkgdesc="High-accuracy NES/Famicom emulator"
url="https://gitlab.com/jgemu/nestopia"
license=('GPL-2.0-only')
arch=('x86_64')

depends=(
  hicolor-icon-theme
  libarchive
  libepoxy
  qt6-base
  sdl3
  speexdsp
)
makedepends=(
  cmake
  git
  ninja
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="nestopia.jgemu"
_pkgsrc_jg="jg"
_pkgsrc_qtea="qtea"
source=(
  "$_pkgsrc"::"git+https://gitlab.com/jgemu/nestopia.git"
  "$_pkgsrc_jg"::"git+https://gitlab.com/jgemu/jg.git"
  "$_pkgsrc_qtea"::"git+https://gitlab.com/jgemu/qtea.git"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  export PKG_CONFIG_PATH="$srcdir/$_pkgsrc_jg/build/share/pkgconfig:$PKG_CONFIG_PATH"

  echo ":: Preparing jg headers..."
  pushd "$_pkgsrc_jg" > /dev/null
  make install PREFIX="$srcdir/$_pkgsrc_jg/build"
  popd > /dev/null

  echo ":: Building nestopia-jg..."
  pushd "$_pkgsrc" > /dev/null
  make ENABLE_STATIC_JG=1 DISABLE_MODULE=1
  popd > /dev/null

  echo ":: Building qtea..."
  local _cmake_options=(
    -B build
    -S "$_pkgsrc_qtea"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DQTEA_CORE_DIR="$srcdir/$_pkgsrc/nestopia"
    -Wno-author
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
