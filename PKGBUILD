# Maintainer: sker <skippiepie@pm.me>
pkgname=sonixy-git
pkgver=0.2.1
pkgrel=1
pkgdesc="Lightweight audio collection manager"
arch=('x86_64')
url="https://codeberg.org/sker/sonixy"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libnm' 'libappindicator-gtk3' 'librsvg' 'sqlite')
makedepends=('cargo' 'nodejs' 'pnpm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('24a1e42144950c5e466c4f52b05ed81231980591bde2dce239a67f95f98ab37e')

build() {
  cd sonixy
  # Use system sqlite instead of bundled to avoid linking issues on Arch
  sed -i 's/features = \["bundled"\]//g' src-tauri/Cargo.toml
  pnpm install
  pnpm tauri build --bundles deb
}

package() {
  cd sonixy
  # Install binary
  install -Dm755 "src-tauri/target/release/sonixy" "$pkgdir/usr/bin/sonixy"

  # Install desktop file and icons from the generated bundle
  _bundle="src-tauri/target/release/bundle/deb/Sonixy_${pkgver}_amd64/data/usr"
  install -Dm644 "${_bundle}/share/applications/Sonixy.desktop" "$pkgdir/usr/share/applications/sonixy.desktop"
  cp -r "${_bundle}/share/icons" "$pkgdir/usr/share/"
}
