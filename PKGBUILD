# Maintainer: screwy <screwygit@proton.me>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=rufin-git
pkgver=0.9.0.r35.gfda58af
pkgrel=1
pkgdesc='Native GTK4/libadwaita music client for Jellyfin, Subsonic, Navidrome and local libraries written in Rust'
arch=('x86_64' 'aarch64')
url='https://github.com/screwys/Rufin'
license=('GPL-3.0-or-later')
# Generated Linux package dependencies start.
depends=(
  'gcc-libs'
  'glib2'
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
# Generated Linux package dependencies end.
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
  cargo build --frozen --release -p rufin
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
  install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/actions" \
    data/icons/hicolor/scalable/actions/*.svg
  install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/status" \
    data/icons/hicolor/scalable/status/*.svg
  install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/512x512/apps" \
    data/icons/hicolor/512x512/apps/*.png
  install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/64x64/apps" \
    data/icons/hicolor/64x64/apps/*.png

  local lang po_file
  for po_file in crates/localization/locales/*.po; do
    [[ -f $po_file ]] || continue
    lang=${po_file##*/}
    lang=${lang%.po}
    install -dm755 "$pkgdir/usr/share/locale/$lang/LC_MESSAGES"
    msgfmt "$po_file" -o "$pkgdir/usr/share/locale/$lang/LC_MESSAGES/rufin.mo"
  done
}
