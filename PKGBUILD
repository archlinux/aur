# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154
pkgname=misari-git
pkgver=26.4.0.v1.0.r17.gb9c5c01
pkgrel=1
_upstreamver=26.4.0
pkgdesc='Personal niri fork with a scrollable tiling Wayland desktop'
arch=('x86_64')
url='https://github.com/mengdehong/Misari'
_srcname=misari
license=('GPL-3.0-or-later')
depends=(
  'cairo' 'glib2' 'glibc' 'libdisplay-info' 'libgcc' 'libinput'
  'libpipewire' 'libxkbcommon' 'libglvnd' 'mesa' 'pango' 'pixman'
  'seatd' 'systemd' 'systemd-libs' 'wayland' 'xdg-desktop-portal' 'xdg-desktop-portal-impl'
)
makedepends=('git' 'rust>=1.87' 'clang' 'pkgconf')
optdepends=(
  'xwayland-satellite: X11 application support'
  'xdg-desktop-portal-gnome: screencasting'
  'xdg-desktop-portal-gtk: file chooser and other desktop portals'
)
provides=("misari=${pkgver%%.r*}" "niri=$_upstreamver" 'wayland-compositor')
conflicts=('misari' 'niri')
# Cargo controls Rust LTO; GCC LTO objects cannot be linked by rustc's lld.
options=('!debug' '!lto')
source=("misari::git+https://github.com/mengdehong/Misari.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_srcname" || return
  local version="${pkgver%%.r*}"
  printf '%s.r%s.g%s\n' "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir/$_srcname/niri" || return
  cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
  export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix=$srcdir=."
  cd "$srcdir/$_srcname/niri" || return
  cargo build --frozen --release --bin niri --target-dir "$srcdir/target-misari"
}

check() {
  local binary="$srcdir/target-misari/release/niri"
  local libraries
  libraries=$(ldd "$binary")
  if [[ "$libraries" == *'not found'* ]]; then
    printf '%s\n' "$libraries" >&2
    return 1
  fi
  "$binary" validate --config "$srcdir/$_srcname/niri/resources/default-config.kdl"
}

package() {
  local resources="$srcdir/$_srcname/niri/resources"
  install -Dm755 "$srcdir/target-misari/release/niri" "$pkgdir/usr/bin/niri"
  install -Dm755 "$resources/niri-session" "$pkgdir/usr/bin/niri-session"
  install -Dm644 "$resources/niri.desktop" "$pkgdir/usr/share/wayland-sessions/niri.desktop"
  install -Dm644 "$resources/niri.service" "$pkgdir/usr/lib/systemd/user/niri.service"
  sed -i 's|^ExecStart=.*|ExecStart=/usr/bin/niri --session|' \
    "$pkgdir/usr/lib/systemd/user/niri.service"
  install -Dm644 "$resources/niri-shutdown.target" "$pkgdir/usr/lib/systemd/user/niri-shutdown.target"

  install -Dm644 "$resources/niri-portals.conf" "$pkgdir/usr/share/xdg-desktop-portal/niri-portals.conf"
  install -Dm644 "$resources/default-config.kdl" "$pkgdir/usr/share/doc/misari/config.kdl"
  install -Dm644 "$srcdir/$_srcname/niri/docs/README.md" "$pkgdir/usr/share/doc/misari/README.md"
  install -Dm644 "$srcdir/$_srcname/niri/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
