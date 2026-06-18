# Maintainer: sk <sk at sk dot sk>

pkgname=noteriv
pkgver=2.2.1
pkgrel=1
pkgdesc="A fast, open-source markdown editor with graph view, plugin API, themes, Git/WebDAV sync, and AI MCP server — built on Tauri 2"
arch=('x86_64')
url="https://github.com/thejacedev/Noteriv"
license=('MIT')
depends=('webkit2gtk-4.1' 'libsoup3' 'gtk3')
makedepends=('npm' 'cargo' 'rust')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}" "noteriv-bin")
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/thejacedev/Noteriv/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('299e8f8a1e2a4142f1e8b542b1a35768ecbc452629582c77ad0f57a70d5c9c6a')

build() {
  cd "${srcdir}/Noteriv-${pkgver}/desktop"
  npm install
  npm run build:next
  cd src-tauri
  cargo build --release
}

package() {
  cd "${srcdir}/Noteriv-${pkgver}/desktop"
  install -Dm755 "src-tauri/target/release/noteriv" "${pkgdir}/usr/bin/noteriv"

  install -Dm644 "src-tauri/icons/32x32.png" \
    "${pkgdir}/usr/share/icons/hicolor/32x32/apps/noteriv.png"
  install -Dm644 "src-tauri/icons/128x128.png" \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/noteriv.png"
  install -Dm644 "src-tauri/icons/icon.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/noteriv.png"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/noteriv.desktop" <<EOF
[Desktop Entry]
Name=Noteriv
Comment=Modern markdown editor with plugins, themes, and sync
Exec=/usr/bin/noteriv
Icon=noteriv
Type=Application
Categories=Office;Utility;TextEditor;
Terminal=false
MimeType=text/markdown;
EOF
}
