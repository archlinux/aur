# Maintainer: NullBite <aur.archlinux@nullbite.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Jonas Witschel <diabonas@archlinux.org>

pkgname=qpwgraph-git
pkgver=0.6.0.r4.g1665d36
pkgver() {
  cd "${pkgname%-git}"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
pkgdesc='PipeWire Graph Qt GUI Interface (git version)'
arch=(x86_64)
url="https://gitlab.freedesktop.org/rncbc/qpwgraph"
license=(GPL-2.0-or-later)
groups=(pro-audio)
depends=(
  gcc-libs
  glibc
  hicolor-icon-theme
  qt6-base
  qt6-svg
)
makedepends=(
  git
  alsa-lib
  cmake
  pipewire
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(qpwgraph::git+$url)
sha512sums=('SKIP')

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CONFIG_WAYLAND=ON
    -S "${pkgname%-git}"
    -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  depends+=(
  alsa-lib libasound.so
  pipewire libpipewire-0.3.so
  )
  DESTDIR="$pkgdir" cmake --install build
}
