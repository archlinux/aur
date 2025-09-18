# Maintainer: JC Olivares <juancri@juancri.com>

pkgname=gnome-console-jc
pkgver=48.0.1.2
pkgrel=1
pkgdesc="A simple user-friendly terminal emulator for the GNOME desktop (JC fork)"
url="https://github.com/juancri/console"
arch=(x86_64)
license=(GPL-3.0-or-later)
depends=(
  dconf
  gcc-libs
  gtk4
  glib2
  glibc
  hicolor-icon-theme
  libadwaita
  libgtop
  pango
  vte4
)
makedepends=(
  appstream
  git
  glib2-devel
  meson
)
checkdepends=(
  dbus
  mutter
)
groups=(gnome)
source=("$pkgname::git+https://github.com/juancri/console.git#tag=jc-48.0.1-r2")
sha256sums=('SKIP')

prepare() {
  cd $pkgname
}

build() {
  local meson_options=(
    -D tests=true
  )

  arch-meson $pkgname build "${meson_options[@]}"
  meson compile -C build
}

check() (
  export XDG_RUNTIME_DIR="$PWD/runtime-dir"
  mkdir -p -m 700 "$XDG_RUNTIME_DIR"

  dbus-run-session -- \
  mutter \
    --headless \
    --wayland \
    --no-x11 \
    --virtual-monitor 1024x768 \
    -- \
      meson test -C build --print-errorlogs
)

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
