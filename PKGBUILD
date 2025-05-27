# Maintainer: Thomas Scholtes <geigerzaehler@axiom.fm>
#
# shellcheck shell=bash disable=SC2034 disable=SC2154

_commit=33dd37714b7dbf56a11339a4c6f56f11d8b85351
pkgname=radicle-desktop
pkgver='0.4.1'
pkgrel='1'
pkgdesc='Radicle desktop app'
arch=('x86_64')
url='https://www.radworks.garden/'
license=('GPL-3.0-only')
depends=(
  'radicle-node-bin'
  # See https://v2.tauri.app/distribute/aur/#building-from-source
  'cairo'
  'desktop-file-utils'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup'
  'pango'
  'webkit2gtk-4.1'
)
makedepends=(
  # See https://v2.tauri.app/distribute/aur/#building-from-source
  'git'
  'openssl'
  'appmenu-gtk-module'
  'libappindicator-gtk3'
  'librsvg'
  'rustup'
  'npm'
  'nodejs'
)
options=('!strip' '!emptydirs' '!lto')
source=("$pkgname::git+https://seed.radicle.xyz/z4D5UCArafTzTQpDZNQRuqswh3ury.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname" || return 1

  npm install
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname" || return 1

  npx tauri build --bundles deb
}

package() {
  cp -a $pkgname/target/release/bundle/deb/${pkgname}_${pkgver}_*/data/* "${pkgdir}"
}
