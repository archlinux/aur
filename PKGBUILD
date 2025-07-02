# Maintainer: 0xGingi <0xgingi@0xgingi.com>
pkgname=claude-tauri-desktop-git
_pkgname=claude-tauri-desktop
pkgver=0.1.0.r5.g2e1f61c
pkgrel=1
pkgdesc="A desktop application for Claude"
arch=('x86_64')
url="https://github.com/0xgingi/claude-tauri-desktop"
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator' 'xdg-utils')
makedepends=('git' 'rust' 'bun' 'nodejs' 'npm' 'python')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')
options=('!lto')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  local version=$(grep -m1 'version = ' src-tauri/Cargo.toml | cut -d '"' -f2)
  printf "%s.r%s.g%s" "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"
  bun install
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  bun run tauri build
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
  install -dm755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm755 "src-tauri/target/release/claude-tauri-desktop" "${pkgdir}/usr/bin/claude-tauri-desktop"
  
  cat > "${pkgdir}/usr/share/applications/claude-tauri-desktop.desktop" << EOF
[Desktop Entry]
Name=Claude
Comment=A desktop application for Claude
Exec=claude-tauri-desktop
Icon=claude-tauri-desktop
Terminal=false
Type=Application
Categories=Network;Utility;
EOF
  
  install -Dm644 "src-tauri/icons/claude.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/claude-tauri-desktop.png"
  
  if [ -f "public/claude.svg" ]; then
    install -Dm644 "public/claude.svg" \
      "${pkgdir}/usr/share/icons/hicolor/scalable/apps/claude-tauri-desktop.svg"
  fi
  
  if [ -f "LICENSE" ]; then
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
} 

