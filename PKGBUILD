# Maintainer: somnus0917 <somnus0917@gmail.com>
pkgname=superlabel
pkgver=0.1.3
pkgrel=2
pkgdesc="Lightweight desktop annotation tool for object detection datasets"
arch=('x86_64')
url="https://github.com/somnus0917/superlabel"
license=('MIT')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'libappindicator-gtk3'
    'librsvg'
)
makedepends=(
    'cargo'
    'nodejs'
    'pnpm'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "${pkgname}-${pkgver}"
    pnpm install --frozen-lockfile
}

build() {
    cd "${pkgname}-${pkgver}"
    pnpm build
    cd src-tauri
    cargo build --release
}

package() {
    cd "${pkgname}-${pkgver}"
    
    install -Dm755 "src-tauri/target/release/${pkgname}" \
        "${pkgdir}/usr/bin/${pkgname}"
    
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" << EOF
[Desktop Entry]
Name=SuperLabel
Comment=Lightweight annotation tool for object detection
Exec=env WEBKIT_DISABLE_DMABUF_RENDERER=1 GDK_BACKEND=x11 ${pkgname} %F
Icon=${pkgname}
Type=Application
Categories=Development;Science;
MimeType=inode/directory;
EOF
    
    install -Dm644 "src-tauri/icons/icon.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
