# Maintainer: redtide <redtid3@gmail.com>

_pkgname=lxqt-labwc-session
pkgname=$_pkgname-git
pkgver=r36.44da485
pkgrel=1
pkgdesc="LXQt Wayland session configuration using the labwc compositor (git version)"
url="https://github.com/stefonarch/lxqt-labwc-session"
arch=(x86_64)
license=(GPL3)
provides=($_pkgname)
conflicts=($_pkgname)
source=($_pkgname::git+$url)
b2sums=('SKIP')
makedepends=(
  cmake
  git
)
depends=(
  labwc
  liblxqt
  waybar
)
optdepends=(
  "sddm: The recommended LXQt display manager"
# "yatbfw: Yes another task bar for Wayland"
# "lxqt-wlogout: Logout menu for wayland environments which exits also a running LXQt-session"
  "swaybg: Wallpaper tool for Wayland compositors"
  "swaylock: Screen locker for Wayland"
  "swayidle: Idle management daemon for Wayland"
)

pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  local cmake_options=(
    -B build
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_BUILD_TYPE=None
    -S $_pkgname
    -W no-dev
  )
  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
