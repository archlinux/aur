# Maintainer: weversonl
pkgname=gnome-quick-share
pkgver=0.12.0
pkgrel=1
pkgdesc="Quick Share client for GNOME"
arch=('x86_64')
url="https://github.com/weversonl/gnome-quick-share"
license=('AGPL-3.0-only')
options=(!debug)
depends=(
  'gtk4'
  'gtk3'
  'libadwaita'
  'libayatana-appindicator'
  'glib2'
  'dbus'
)
makedepends=(
  'git'
  'rust'
  'cargo'
  'gettext'
)
source=("$pkgname::git+https://github.com/weversonl/gnome-quick-share.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo build --release -p gnomeqs -p gnomeqs-tray
}

package() {
  _bundledir="$srcdir/target/release"
  cd "$srcdir/$pkgname"

  # Binary
  install -Dm755 "$_bundledir/gnomeqs" "$pkgdir/usr/bin/gnomeqs"
  install -Dm755 "$_bundledir/gnomeqs-tray" "$pkgdir/usr/bin/gnomeqs-tray"

  # Desktop entry
  install -dm755 "$pkgdir/usr/share/applications"
  install -Dm644 "$srcdir/$pkgname/app/gtk/data/io.github.weversonl.GnomeQS.desktop" \
    "$pkgdir/usr/share/applications/io.github.weversonl.GnomeQS.desktop"

  # AppStream metadata
  install -Dm644 "$srcdir/$pkgname/app/gtk/data/io.github.weversonl.GnomeQS.metainfo.xml" \
    "$pkgdir/usr/share/metainfo/io.github.weversonl.GnomeQS.metainfo.xml"

  # GSettings schema
  install -Dm644 "$srcdir/$pkgname/app/gtk/data/io.github.weversonl.GnomeQS.gschema.xml" \
    "$pkgdir/usr/share/glib-2.0/schemas/io.github.weversonl.GnomeQS.gschema.xml"

  # Icons
  _icondir="$srcdir/$pkgname/app/gtk/data/icons"
  install -Dm644 "$_icondir/32x32.png"      "$pkgdir/usr/share/icons/hicolor/32x32/apps/io.github.weversonl.GnomeQS.png"
  install -Dm644 "$_icondir/128x128.png"    "$pkgdir/usr/share/icons/hicolor/128x128/apps/io.github.weversonl.GnomeQS.png"
  install -Dm644 "$_icondir/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/io.github.weversonl.GnomeQS.png"
  install -Dm644 "$_icondir/tray_mono.png"  "$pkgdir/usr/share/icons/hicolor/32x32/apps/io.github.weversonl.GnomeQS-symbolic.png"
  install -Dm644 "$_icondir/hicolor/scalable/actions/io.github.weversonl.GnomeQS-airdrop-symbolic.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/actions/io.github.weversonl.GnomeQS-airdrop-symbolic.svg"
  install -Dm644 "$_icondir/hicolor/scalable/status/io.github.weversonl.GnomeQS-tray-symbolic.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/status/io.github.weversonl.GnomeQS-tray-symbolic.svg"

  # Locales
  for lang in pt_BR; do
    install -dm755 "$pkgdir/usr/share/locale/$lang/LC_MESSAGES"
    msgfmt -o "$pkgdir/usr/share/locale/$lang/LC_MESSAGES/gnomeqs.mo" "app/gtk/po/$lang.po"
  done
}
