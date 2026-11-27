# Maintainer: Ivan Potiienko <contact@xxanqw.pp.ua>
pkgname=waypin
pkgver=0.2.0
pkgrel=1
pkgdesc="A clipboard viewer for Wayland/X11 with GTK3, written in Rust"
arch=('x86_64')
url="https://github.com/komparator147477/waypin"
license=('GPL3')
depends=('gtk3' 'gdk-pixbuf2' 'gtk-layer-shell' 'wl-clipboard')
makedepends=('cargo' 'git')
install="$pkgname.install"
# The packaged binary enables both optional features. gtk-layer-shell is a
# runtime dependency because Cargo feature selection is compile-time.
# The systemd unit self-skips on non-Hyprland sessions via its Condition*
# directives, so it can be installed unconditionally.
optdepends=(
  'hyprland: for the global-shortcut background daemon'
  'xclip: for X11 sessions'
  'systemd: for the background daemon service'
  'xdg-desktop-portal-hyprland: for Hyprland GlobalShortcuts portal support'
)
source=("git+${url}.git#branch=restoring")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  # The 0.2.0 source still records 0.1.8 for waypin in Cargo.lock.
  sed -i '/^name = "waypin"$/{n;s/^version = "0\.1\.8"$/version = "'"$pkgver"'"/;}' Cargo.lock
}

build() {
  cd "$pkgname"
  cargo build --release --locked --target-dir "$srcdir/target" \
    --features 'global-shortcuts pin-on-top'
}

package() {
  cd "$pkgname"
  install -Dm755 "$srcdir/target/release/waypin" "$pkgdir/usr/bin/waypin"
  install -Dm644 systemd/waypin.service "$pkgdir/usr/lib/systemd/user/waypin.service"
}
