# Maintainer:

_pkgname="pamac-tray-plasma"
pkgname="$_pkgname-git"
pkgver=r21.58353a1
pkgrel=1
pkgdesc="Pamac tray icon for Plasma"
url="https://gitlab.com/LordTermor/pamac-tray-icon-plasma"
license=('Unknown')
arch=('x86_64')

depends=(
  'knotifications'
  'kstatusnotifieritem'
  'libpamac'
  'qt6-base'
)
makedepends=(
  'cmake'
  'ninja'
)

provides=(
  "$_pkgname"
  'pamac-tray-icon-plasma'
)
conflicts=(
  "$_pkgname"
  'pamac-tray-icon-plasma'
)

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
