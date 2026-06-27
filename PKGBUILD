# Maintainer: screwy <screwygit@proton.me>
# shellcheck shell=bash disable=SC2034

pkgname=rufin
pkgver=0.7.11
pkgrel=1
pkgdesc='Native GTK4/libadwaita music client for Jellyfin, Subsonic, Navidrome and local libraries written in Rust'
arch=('x86_64' 'aarch64')
url='https://github.com/screwys/Rufin'
license=('GPL-3.0-or-later')
depends=(
  'gcc-libs'
  'gdk-pixbuf2'
  'glibc'
  'gst-libav'
  'gst-plugins-bad'
  'gst-plugins-base'
  'gst-plugins-base-libs'
  'gst-plugins-good'
  'gst-plugins-ugly'
  'gstreamer'
  'gtk4'
  'hicolor-icon-theme'
  'libadwaita'
)
makedepends=(
  'cargo'
  'gettext'
  'pkgconf'
)
conflicts=('rufin-git')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/screwys/Rufin/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ef164d2ace737e57eb0b02b40b5ae2c93ee9660e2bd4d280dcd37dc4abc8bafc')

prepare() {
  cd "Rufin-${pkgver}" || return

  export CARGO_TARGET_DIR=target
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "Rufin-${pkgver}" || return

  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p rufin
}

package() {
  cd "Rufin-${pkgver}" || return

  install -Dm755 target/release/rufin "$pkgdir/usr/bin/rufin"
  install -Dm644 data/io.github.screwys.Rufin.desktop \
    "$pkgdir/usr/share/applications/io.github.screwys.Rufin.desktop"
  install -Dm644 data/io.github.screwys.Rufin.metainfo.xml \
    "$pkgdir/usr/share/metainfo/io.github.screwys.Rufin.metainfo.xml"
  install -Dm644 data/icons/hicolor/scalable/apps/io.github.screwys.Rufin.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.screwys.Rufin.svg"
  install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/actions" \
    data/icons/hicolor/scalable/actions/*.svg
  install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/status" \
    data/icons/hicolor/scalable/status/*.svg
  install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/512x512/apps" \
    data/icons/hicolor/512x512/apps/*.png
  install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/64x64/apps" \
    data/icons/hicolor/64x64/apps/*.png

  local lang po_file
  for po_file in locales/*.po; do
    [[ -f $po_file ]] || continue
    lang=${po_file##*/}
    lang=${lang%.po}
    install -dm755 "$pkgdir/usr/share/locale/$lang/LC_MESSAGES"
    msgfmt "$po_file" -o "$pkgdir/usr/share/locale/$lang/LC_MESSAGES/rufin.mo"
  done
}
