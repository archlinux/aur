# Maintainer:
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: aimileus, Sergej Pupykin, Tiago Pierezan Camargo, robb_force

: ${_qtea_ver:=0.1.1}

_pkgname="nestopia"
pkgname="$_pkgname"
pkgver=2.0.0
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

_pkgsrc="$_pkgname-$pkgver"
_pkgsrc_jg="jg-$pkgver"
_pkgsrc_qtea="qtea-$_qtea_ver"

_pkgext="tar.gz"
source=(
  "$_pkgsrc.$_pkgext"::"https://gitlab.com/jgemu/nestopia/-/archive/$pkgver/$_pkgsrc.$_pkgext"
  "$_pkgsrc_jg.$_pkgext"::"https://gitlab.com/jgemu/jg/-/archive/$pkgver/$_pkgsrc_jg.$_pkgext"
  "$_pkgsrc_qtea.$_pkgext"::"https://gitlab.com/jgemu/qtea/-/archive/$_qtea_ver/$_pkgsrc_qtea.$_pkgext"
)
sha256sums=(
  '443820e68ab3394e404ef4f82838262a0f65bb22465158663b867367aac4f39f'
  '299cc660c6f4d962803966061b722fa43e53ccc9884e110333e8110fc8fc8023'
  '98151378b27235b0db65a4c633a7b892cb4581006ae196cf4ea03a551e836878'
)

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
