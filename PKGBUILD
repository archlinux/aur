# Maintainer: Dustin Pilgrim <dustin.pilgrim1997@gmail.com>
#
# Native xdg-desktop-portal backend for the Halley Wayland compositor.
# Provides the ScreenCast and Screenshot portal interfaces by capturing from
# the compositor through Halley's IPC and producing PipeWire streams.
#
# Sourced from the Halley monorepo via portal-specific release tags
# (`halley-portal-v$pkgver`), decoupled from the main compositor release tags
# (`v*`). The package only changes when you bump `pkgver`/`pkgrel` here.

pkgname=xdg-desktop-portal-halley
pkgver=0.2.0
pkgrel=1
pkgdesc="Native xdg-desktop-portal ScreenCast and Screenshot backend for the Halley compositor"
arch=('x86_64')
url="https://github.com/saltnpepper97/halley"
license=('GPL-3.0-only')
depends=('pipewire' 'xdg-desktop-portal' 'mesa' 'libdrm')
makedepends=('cargo' 'rust' 'pkgconf')
optdepends=('halley: the Halley compositor this portal backend captures from')
options=('!debug' '!lto')
# The portal release tag inside the Halley repo. Bump together with pkgver.
_tag="halley-portal-v$pkgver"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_tag.tar.gz")
sha256sums=('2a743f543de22942d3c783e35bc8992c2485809679df1d52bf4ef2ec6e018eda')

# GitHub tag archives extract to "<repo>-<tag>" -> "halley-halley-portal-v$pkgver"
_srcdir="halley-$_tag"

build() {
  cd "$srcdir/$_srcdir"
  export CARGO_TARGET_DIR=target
  cargo build --release --locked -p halley-portal
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
