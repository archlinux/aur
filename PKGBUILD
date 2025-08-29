# Maintainer: Esensats <esensats@gmail.com>

pkgname=wayboard-git
pkgver=0.r86.gc22eb81
pkgrel=1
pkgdesc="libinput-based keyboard input display for Wayland (git master)"
arch=(x86_64 aarch64 armv7h)
url="https://github.com/tesselslate/wayboard"
license=(GPL-3.0-only)
provides=(wayboard)
conflicts=(wayboard)
depends=(
  fcft
  libconfig
  libinput
  pixman
  wayland
  systemd-libs  # provides libudev.so at runtime
)
makedepends=(
  tllist
  git
  meson
  ninja
  pkgconf
  wayland-protocols
  systemd          # libudev headers for building
)
source=("git+https://github.com/tesselslate/wayboard.git")
sha256sums=('SKIP')
install=${pkgname}.install

pkgver() {
  cd "${srcdir}/wayboard"
  # Use commit count and short hash since repo has no tags at present
  printf "0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/wayboard"
}

build() {
  cd "${srcdir}/wayboard"
  meson setup build --prefix=/usr --buildtype=release
  meson compile -C build
}

check() {
  cd "${srcdir}/wayboard"
  # No tests provided
  :
}

package() {
  cd "${srcdir}/wayboard"
  DESTDIR="${pkgdir}" meson install -C build

  # Docs and example configuration
  install -Dm644 example.cfg "${pkgdir}/usr/share/doc/wayboard/example.cfg"

  # License (repo states GPLv3 only)
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
