# Maintainer: Felipe Spychalski <felipe at fspy dot net>
# Contributor: Marlon Konrad <mlkonrad at users dot noreply dot github dot com>
#
# Arch Linux package for Laccy, kept upstream at packaging/arch/PKGBUILD
# and copied to the AUR for each release. It has the popup (laccy), the
# history daemon (laccyd) and laccy-wayland, which watches the clipboard on
# Niri, Hyprland, Sway and other compositors with ext-data-control-v1. The
# GNOME Shell extension is not packaged here; on GNOME it comes from
# extensions.gnome.org.

pkgname=laccy
pkgver=0.1.5
pkgrel=1
pkgdesc='Lightweight, keyboard-first clipboard manager for Wayland'
arch=(x86_64 aarch64)
url='https://github.com/mlkonrad/laccy'
license=(MIT)
depends=(gtk4 libadwaita gdk-pixbuf2 glib2 libgcc glibc)
makedepends=(cargo)
# makepkg's LTO flags make cc compile the SQLite that rusqlite bundles into
# GCC LTO objects, which rust-lld cannot read, so linking fails. The
# release profile strips the binaries, so a debug package would be empty.
options=(!lto !debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('bdf20795bf6b5fdcdd2d86379cf68400860b385ff8dd8d5bd537e1d0d28f6eca')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release --workspace
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 -t "$pkgdir/usr/bin" \
    target/release/laccy target/release/laccyd target/release/laccy-wayland

  sed 's|@BINDIR@|/usr/bin|g' data/io.github.mlkonrad.Laccy.desktop.in |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/io.github.mlkonrad.Laccy.desktop"
  sed 's|@BINDIR@|/usr/bin|g' data/io.github.mlkonrad.Laccy.Daemon.service.in |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/dbus-1/services/io.github.mlkonrad.Laccy.Daemon.service"

  install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps" \
    data/icons/hicolor/scalable/apps/io.github.mlkonrad.Laccy.svg

  # The settings schema keeps its historical name from the extension. It goes
  # to the system schema folder, where laccy and laccy-wayland find it, and
  # the glib2 pacman hook compiles it.
  install -Dm644 -t "$pkgdir/usr/share/glib-2.0/schemas" \
    extension/laccy@mlkonrad.github.com/schemas/org.gnome.shell.extensions.laccy.gschema.xml

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
