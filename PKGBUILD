# Maintainer: fossdd <fossdd@pwned.life>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=chatty-git
pkgver=r1.abeb9ed
pkgrel=1
pkgdesc='Simple to use SMS and Matrix messaging application (development version)'
arch=(x86_64 aarch64 riscv64)
url='https://gitlab.gnome.org/World/Chatty'
license=(GPL-3.0-or-later)
depends=(
  cairo
  dconf
  evolution-data-server
  feedbackd
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gnome-desktop-4
  gstreamer
  gtk4
  gtksourceview5
  hicolor-icon-theme
  libadwaita
  libcmatrix
  libmm-glib
  libphonenumber
  libspelling
  pango
  sqlite
)
makedepends=(
  appstream
  git
  glib2-devel
  itstool
  meson
)
checkdepends=(xorg-server-xvfb)
source=(
  "git+https://gitlab.gnome.org/World/Chatty.git#branch=main"
)
b2sums=('SKIP')

pkgver() {
  cd Chatty
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  arch-meson Chatty build \
    -D purple=disabled
  meson compile -C build
}

check() {
  dbus-run-session xvfb-run \
    -s '-screen 0 1920x1080x24 -nolisten local' \
    meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
