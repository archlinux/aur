# Maintainer: lyokha113 <lyokha113@users.noreply.github.com>

pkgname=lcdiff
pkgver=0.3.7
pkgrel=1
pkgdesc="Inspect, compare, and merge JAR/ZIP archives and folders"
arch=('x86_64')
url="https://github.com/lyokha113/lcdiff"
license=('MIT')
depends=(
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libappindicator-gtk3'
  'librsvg'
  'libsoup3'
  'openssl'
  'pango'
  'webkit2gtk-4.1'
  'xdotool'
)
makedepends=(
  'git'
  'jdk17-openjdk'
  'maven'
  'nodejs'
  'npm'
  'rust'
)
source=(
  "git+https://github.com/lyokha113/lcdiff.git#tag=v${pkgver}"
  'LICENSE'
)
sha256sums=(
  'SKIP'
  'd27aff4b5455cf67f9913035ba270c467041b6e28bfea1047662be0861ac980c'
)
options=('!lto' '!strip')

prepare() {
  cd "$srcdir/$pkgname"
  npm ci
}

build() {
  cd "$srcdir/$pkgname"
  LCDIFF_JLINK="$(command -v jlink)" scripts/assemble-sidecar-resources.sh
  npm run tauri -- build --bundles deb --no-sign
}

package() {
  cd "$srcdir/$pkgname"
  bsdtar -xOf "target/release/bundle/deb/LCDiff_${pkgver}_amd64.deb" data.tar.gz |
    bsdtar -xf - -C "$pkgdir"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
