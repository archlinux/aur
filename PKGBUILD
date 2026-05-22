pkgname=tur-tauri
pkgver=0.5.0
pkgrel=1
pkgdesc="Tur — A sleek, multi-engine download manager"
arch=('x86_64')
url="https://github.com/greykaizen/tur-tauri"
license=('GPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'cairo' 'pango' 'libayatana-appindicator')
makedepends=('cargo' 'npm' 'nodejs' 'yarn')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/greykaizen/tur-tauri/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${pkgname}-${pkgver}"
  
  # Install frontend dependencies and build the app via Tauri CLI
  yarn install
  yarn tauri build --no-bundle
}

package() {
  cd "${pkgname}-${pkgver}"
  
  # Install binary
  install -Dm755 "src-tauri/target/release/tur-tauri" "${pkgdir}/usr/bin/tur-tauri"
  
  # Install icon
  install -Dm644 "src-tauri/icons/512x512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/tur-tauri.png"
  
  # Install desktop file
  mkdir -p "${pkgdir}/usr/share/applications"
  cat <<EOF > "${pkgdir}/usr/share/applications/tur-tauri.desktop"
[Desktop Entry]
Name=Tur
Comment=${pkgdesc}
Exec=tur-tauri
Icon=tur-tauri
Terminal=false
Type=Application
Categories=Network;FileTransfer;
EOF
}
