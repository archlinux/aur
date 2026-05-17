# Maintainer: screwys
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=rufin-git
pkgver=0.1.3.r0.gd2acaff
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
  'git'
  'pkgconf'
)
optdepends=(
  'gnome-keyring: Secret Service provider for saving Jellyfin tokens'
  'kwallet: Secret Service provider for saving Jellyfin tokens'
)
provides=('rufin')
conflicts=('rufin')
options=('!lto')
source=('Rufin::git+https://github.com/screwys/Rufin.git')
sha256sums=('SKIP')

pkgver() {
  cd Rufin || return

  local version
  if version=$(git describe --long --tags --abbrev=7 2>/dev/null); then
    printf '%s\n' "$version" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf 'r%s.g%s\n' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

prepare() {
  cd Rufin || return

  export CARGO_TARGET_DIR=target
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd Rufin || return

  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p rufin-app
}

check() {
  cd Rufin || return

  export CARGO_TARGET_DIR=target
  cargo test --frozen --workspace
}

package() {
  cd Rufin || return

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
