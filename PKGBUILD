# Maintainer: 0xGingi <0xgingi@0xgingi.com>
pkgname=kagi-assistant-desktop-git
_pkgname=kagi-assistant-desktop
pkgver=0.1.0
pkgrel=1
pkgdesc="A desktop application for Kagi Assistant"
arch=('x86_64')
url="https://github.com/0xgingi/kagi-assistant-desktop"
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator' 'xdg-utils')
makedepends=('git' 'rust' 'bun' 'nodejs' 'npm' 'python')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/kagi-assistant-desktop"
  bun install
}

build() {
  cd "${srcdir}/kagi-assistant-desktop"
  bun run tauri build
}

package() {
  cd "${srcdir}/kagi-assistant-desktop"
  
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
  install -dm755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm755 "src-tauri/target/release/kagi-assistant-desktop" "${pkgdir}/usr/bin/kagi-assistant-desktop"
  
  cat > "${pkgdir}/usr/share/applications/kagi-assistant-desktop.desktop" << EOF
[Desktop Entry]
Name=Kagi Assistant
Comment=A desktop application for Kagi Assistant
Exec=kagi-assistant-desktop
Icon=kagi-assistant-desktop
Terminal=false
Type=Application
Categories=Network;Utility;
EOF
  
  install -Dm644 "src-tauri/icons/kagi.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/kagi-assistant-desktop.png"
  
  if [ -f "public/kagi.svg" ]; then
    install -Dm644 "public/kagi.svg" \
      "${pkgdir}/usr/share/icons/hicolor/scalable/apps/kagi-assistant-desktop.svg"
  fi
  
  if [ -f "LICENSE" ]; then
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
} 
