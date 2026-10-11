# Maintainer: 0x5t4l1n <stalin@ideaboxai.com>
pkgname=attackgraph-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Graph-first application security testing platform — crawl, graph, analyze, report"
arch=('x86_64')
url="https://github.com/0x5t4l1n/Attackgraph"
license=('AGPL-3.0-only')
depends=(
    'gtk3'
    'webkit2gtk-4.1'
    'libsoup3'
    'gdk-pixbuf2'
    'cairo'
    'pango'
    'atk'
    'at-spi2-atk'
    'hicolor-icon-theme'
)
optdepends=(
    'ollama: local AI assistant without an API key'
)
provides=("attackgraph=$pkgver")
conflicts=('attackgraph')
options=('!strip')
noextract=("AttackGraph_${pkgver}_amd64.AppImage")

source_x86_64=(
    "AttackGraph_${pkgver}_amd64.AppImage::https://github.com/0x5t4l1n/Attackgraph/releases/download/v${pkgver}/AttackGraph_${pkgver}_amd64.AppImage"
)
sha256sums_x86_64=(
    '390abcf3aa5a3c73c3499a2e5db48452de10e6f51e4207dcc0a679bced92f5ef'
)

prepare() {
    chmod +x "${srcdir}/AttackGraph_${pkgver}_amd64.AppImage"
    cd "${srcdir}"
    ./AttackGraph_${pkgver}_amd64.AppImage --appimage-extract
}

package() {
    cd "${srcdir}/squashfs-root"

    # Main Tauri binary
    install -Dm755 usr/bin/attackgraph \
        "${pkgdir}/usr/bin/attackgraph"

    # Bundled Python backend (PyInstaller binary, no Python required)
    install -Dm755 usr/bin/attackgraph-backend \
        "${pkgdir}/usr/lib/attackgraph/attackgraph-backend"

    # Desktop entry (with corrected Categories)
    install -Dm644 /dev/stdin \
        "${pkgdir}/usr/share/applications/attackgraph.desktop" << 'DESKTOP'
[Desktop Entry]
Version=1.0
Type=Application
Name=AttackGraph
GenericName=Application Security Tester
Comment=AttackGraph — Intelligent Web Application Attack-Path Mapper
Exec=attackgraph
Icon=attackgraph
Terminal=false
Categories=Security;Network;Development;
Keywords=security;pentest;scanner;graph;attack;appsec;
StartupWMClass=attackgraph
StartupNotify=true
DESKTOP

    # Icons
    install -Dm644 usr/share/icons/hicolor/32x32/apps/attackgraph.png \
        "${pkgdir}/usr/share/icons/hicolor/32x32/apps/attackgraph.png"
    install -Dm644 usr/share/icons/hicolor/128x128/apps/attackgraph.png \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/attackgraph.png"
    # 256x256 from root PNG (higher quality)
    install -Dm644 AttackGraph.png \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/attackgraph.png"
    install -Dm644 AttackGraph.png \
        "${pkgdir}/usr/share/pixmaps/attackgraph.png"

    # License
    install -Dm644 /dev/stdin \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << 'EOF'
MIT License — see https://github.com/0x5t4l1n/Attackgraph/blob/main/LICENSE
EOF
}
