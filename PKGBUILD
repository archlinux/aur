pkgname=halley-git
_pkgname=halley
pkgver=r616.2a9e55c
pkgrel=1
pkgdesc="Spatial Wayland compositor built around infinite workspace navigation"
arch=('x86_64')
url="https://github.com/saltnpepper97/halley"
license=('GPL-3.0-or-later')
depends=(
  'wayland'
  'libxkbcommon'
  'libinput'
  'seatd'
  'mesa'
  'libdisplay-info'
  'libdrm'
  'pipewire'
  'xdg-desktop-portal'
)
makedepends=(
  'git'
  'rust'
  'cargo'
  'pkgconf'
)
optdepends=(
  'xwayland-satellite: X11 application support'
  'xdg-desktop-portal-gtk: fallback backend for common file/dialog portals'
  'fuzzel: launcher bound to Super+d by default'
  'ghostty: terminal for the default open-terminal binding'
  'kitty: terminal for the default open-terminal binding'
  'foot: terminal for the default open-terminal binding'
  'wezterm: terminal for the default open-terminal binding'
  'alacritty: terminal for the default open-terminal binding'
  'wireplumber: provides wpctl for default media-key bindings'
)
provides=('halley')
conflicts=('halley')
source=("git+https://github.com/saltnpepper97/halley.git#branch=dev")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  export CARGO_TARGET_DIR=target
  cargo build --release --locked -p halley -p halley-cli -p halley-portal
}

check() {
  cd "$srcdir/$_pkgname"
  cargo test --release --locked -p halley-cli --no-fail-fast || true
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 "target/release/halley" \
    "$pkgdir/usr/bin/halley"

  install -Dm755 "target/release/halleyctl" \
    "$pkgdir/usr/bin/halleyctl"

  install -Dm755 "target/release/xdg-desktop-portal-halley" \
    "$pkgdir/usr/bin/xdg-desktop-portal-halley"

  install -Dm755 "packaging/wayland-sessions/halley-session" \
    "$pkgdir/usr/bin/halley-session"

  install -Dm644 "packaging/wayland-sessions/halley.desktop" \
    "$pkgdir/usr/share/wayland-sessions/halley.desktop"

  install -Dm644 "packaging/dbus-1/services/org.freedesktop.impl.portal.desktop.halley.service" \
    "$pkgdir/usr/share/dbus-1/services/org.freedesktop.impl.portal.desktop.halley.service"

  install -Dm644 "packaging/xdg-desktop-portal/portals/halley.portal" \
    "$pkgdir/usr/share/xdg-desktop-portal/portals/halley.portal"

  install -Dm644 "packaging/xdg-desktop-portal/halley-portals.conf" \
    "$pkgdir/usr/share/xdg-desktop-portal/halley-portals.conf"

  install -Dm644 "packaging/systemd-user/halley.service" \
    "$pkgdir/usr/lib/systemd/user/halley.service"

  install -Dm644 "packaging/systemd-user/halley-shutdown.target" \
    "$pkgdir/usr/lib/systemd/user/halley-shutdown.target"

  if [[ -f LICENSE ]]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
