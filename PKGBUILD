# Maintainer: Dustin Pilgrim <dustin.pilgrim1997@gmail.com>
#
# Native xdg-desktop-portal backend for the Halley Wayland compositor.
# Provides the ScreenCast and Screenshot portal interfaces by capturing from
# the compositor through Halley's IPC and producing PipeWire streams.
#
# Sourced from the immutable Halley release containing this portal version.
# The portal retains its own version; it does not inherit the compositor version.

pkgname=xdg-desktop-portal-halley
pkgver=0.2.1
pkgrel=1
pkgdesc="Native xdg-desktop-portal ScreenCast and Screenshot backend for the Halley compositor"
arch=('x86_64')
url="https://github.com/saltnpepper97/halley"
license=('GPL-3.0-only')
depends=('pipewire' 'xdg-desktop-portal' 'mesa' 'libdrm')
makedepends=('cargo' 'rust' 'pkgconf')
optdepends=('halley: the Halley compositor this portal backend captures from')
options=('!debug' '!lto')
# Halley v0.8.0 contains halley-portal v0.2.1.
_tag="v0.8.0"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_tag.tar.gz")
sha256sums=('70c0b5ba02a4e83a8ac22e4e910c5b516045ed407c4034721e987b5c324f1d17')

# GitHub strips the v prefix in the release archive directory.
_srcdir="halley-${_tag#v}"

build() {
  cd "$srcdir/$_srcdir"
  export CARGO_TARGET_DIR=target
  cargo build --release --locked -p halley-portal
}

check() {
  cd "$srcdir/$_srcdir"
  cargo test --release --locked -p halley-portal
}

package() {
  cd "$srcdir/$_srcdir"

  install -Dm755 "target/release/xdg-desktop-portal-halley" \
    "$pkgdir/usr/bin/xdg-desktop-portal-halley"

  install -Dm644 "packaging/dbus-1/services/org.freedesktop.impl.portal.desktop.halley.service" \
    "$pkgdir/usr/share/dbus-1/services/org.freedesktop.impl.portal.desktop.halley.service"

  install -Dm644 "packaging/systemd-user/xdg-desktop-portal-halley.service" \
    "$pkgdir/usr/lib/systemd/user/xdg-desktop-portal-halley.service"

  install -Dm644 "packaging/xdg-desktop-portal/portals/halley.portal" \
    "$pkgdir/usr/share/xdg-desktop-portal/portals/halley.portal"

  install -Dm644 "packaging/xdg-desktop-portal/halley-portals.conf" \
    "$pkgdir/usr/share/xdg-desktop-portal/halley-portals.conf"

  install -Dm644 "LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
