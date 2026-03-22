# Maintainer: Vinay Yadav <vinayydv343@gmail.com>
pkgname=tsubasaflow
pkgver=0.1.6
pkgrel=1
pkgdesc="Modern desktop BitTorrent client with cloud debrid integration"
arch=('x86_64')
url="https://github.com/vinayydv3695/Tsubasa-"
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator' 'openssl')
makedepends=('rust' 'cargo' 'npm' 'nodejs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b95f3659c57f2a5a0b962e7fe5aa362adddd8bdff2b9edfe4b6e60a1f16a6d72')

prepare() {
    cd "${srcdir}/Tsubasa--${pkgver}"
    npm ci
}

build() {
    cd "${srcdir}/Tsubasa--${pkgver}"
    
    npm run build
    
    cd src-tauri
    cargo build --release
}

package() {
    cd "${srcdir}/Tsubasa--${pkgver}"
    
    install -Dm755 "src-tauri/target/release/tsubasa" "${pkgdir}/usr/bin/tsubasaflow"
    
    install -Dm644 "src-tauri/icons/128x128.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/tsubasaflow.png"
    
    install -Dm644 "src-tauri/icons/32x32.png" \
        "${pkgdir}/usr/share/icons/hicolor/32x32/apps/tsubasaflow.png"
    
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    cat > "${pkgdir}/usr/share/applications/tsubasaflow.desktop" << EOF
[Desktop Entry]
Type=Application
Name=TsubasaFlow
Comment=Modern BitTorrent client with cloud debrid integration
Exec=/usr/bin/tsubasaflow
Icon=tsubasaflow
Categories=Network;FileTransfer;P2P;
Terminal=false
StartupWMClass=Tsubasa
EOF
}
