# Maintainer: HyDE-Project https://github.com/HyDE-Project

_pkgname="hyprquery"
pkgname="$_pkgname-git"
pkgver=0.6.8.r1.r9.g646ed2e
pkgrel=1
pkgdesc="CLI utility to query Hyprland config values"
arch=('x86_64' 'aarch64')
url="https://github.com/HyDE-Project/hyprquery"
license=('GPL-3.0-or-later')

depends=(
  gcc-libs
  glibc
  hyprlang
  cli11
  nlohmann-json
  libxkbcommon
)
makedepends=(
  cmake
  git
  ninja
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc=$_pkgname
source=("$_pkgsrc::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D HYPRQUERY_DISTRO_BUILD=ON
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
