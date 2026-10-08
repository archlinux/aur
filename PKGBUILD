# Maintainer: JC Olivares <juancri@juancri.com>

pkgname=gnome-console-jc
pkgver=51.0
pkgrel=1
pkgdesc="A simple user-friendly terminal emulator for the GNOME desktop (JC fork)"
url="https://github.com/juancri/console"
arch=(x86_64)
license=(GPL-3.0-or-later)
depends=(
  dconf
  gcc-libs
  'gtk4>=4.22'
  'glib2>=2.88'
  glibc
  hicolor-icon-theme
  'libadwaita>=1.9'
  libgtop
  pango
  'vte4>=0.77'
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
source=("$pkgname::git+https://github.com/juancri/console.git#tag=jc-51.0-r1")
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
