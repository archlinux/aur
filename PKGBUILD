# Maintainer: screwys
# shellcheck shell=bash disable=SC2034

pkgname=rufin
pkgver=0.1.4
pkgrel=1
pkgdesc='Native GTK4 Jellyfin/Subsonic Client in Rust'
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
optdepends=(
  'gnome-keyring: Secret Service provider for saving Jellyfin tokens'
  'kwallet: Secret Service provider for saving Jellyfin tokens'
)
conflicts=('rufin-git')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/screwys/Rufin/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d68a205c3686c7c52019b002c631817b4664dddf5c45d8ff7dceebfa0657f098')

prepare() {
  cd "Rufin-${pkgver}" || return

  export CARGO_TARGET_DIR=target
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "Rufin-${pkgver}" || return

  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p rufin-app
}

check() {
  cd "Rufin-${pkgver}" || return

  export CARGO_TARGET_DIR=target
  cargo test --frozen --workspace
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

  local lang po_file
  for po_file in po/*.po; do
    [[ -f $po_file ]] || continue
    lang=${po_file##*/}
    lang=${lang%.po}
    install -dm755 "$pkgdir/usr/share/locale/$lang/LC_MESSAGES"
    msgfmt "$po_file" -o "$pkgdir/usr/share/locale/$lang/LC_MESSAGES/rufin.mo"
  done
}
