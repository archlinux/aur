# Maintainer:
# Contributor: Kazel <address at domain dot tld>

_pkgname="klevernotes"
pkgname="$_pkgname"
pkgver=1.2.4
pkgrel=1
pkgdesc="A convergent markdown note taking application"
url="https://invent.kde.org/office/klevernotes"
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later')
arch=('x86_64')

depends=(
  'hicolor-icon-theme'
  'kcolorscheme'
  'kconfig'
  'kcoreaddons'
  'ki18n'
  'kiconthemes'
  'kio'
  'kirigami'
  'kirigami-addons'
  'kitemmodels'
  'qt6-base'
  'qt6-declarative'
  'qt6-webchannel'
  'qt6-webengine'
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
  'ninja'
)
checkdepends=(
  'weston'
  'wlheadless-run' # aur/xwayland-run
)

_pkgsrc="$_pkgname-v$pkgver"
_pkgext="tar.gz"
source=("$_pkgname-$pkgver.$_pkgext"::"$url/-/archive/v${pkgver}/$_pkgsrc.$_pkgext")
sha256sums=('a7d6c0b39ea6c309df287dd7822ce5c8cc5c83791487ecdce02390b639fd8236')

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DBUILD_TESTING=$CHECKFUNC
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

check() {
  local _headless_run=(
    wlheadless-run
    -c weston --width=1920 --height=1080
  )

  env "${_headless_run[@]}" -- ctest --test-dir build --rerun-failed --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
