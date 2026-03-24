# Maintainer: Thomas Scholtes <geigerzaehler@axiom.fm>
#
# shellcheck shell=bash disable=SC2034 disable=SC2154 disable=SC2164

_commit=ee36f75d0593e243b56e5035dc92ad486befb70d
pkgname=radicle-desktop
pkgver='0.10.0'
pkgrel='1'
pkgdesc='Radicle desktop app'
arch=('x86_64')
url='https://www.radworks.garden/'
license=('GPL-3.0-only')
depends=(
  'radicle-node'
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
  'cargo'
  'npm'
  'nodejs'
)
options=('!strip' '!emptydirs' '!lto')
source=("$pkgname::git+https://seed.radicle.xyz/z4D5UCArafTzTQpDZNQRuqswh3ury.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"

  npm install
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"

  npx tauri build --bundles deb
}

package() {
  cp -a $pkgname/target/release/bundle/deb/${pkgname}_${pkgver}_*/data/* "${pkgdir}"
}
