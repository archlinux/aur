# Maintainer: Ernesto Cruz <ernestobritocruz05@gmail.com>
pkgname=packet-term
pkgver=0.1.0
pkgrel=1
pkgdesc="A terminal multiplexer and broadcast system for network engineers with GNS3/EVE-NG integration"
arch=('x86_64')
url="https://github.com/ernestoCruz05/packet"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'openssl' 'libssh2')
makedepends=('rust' 'cargo' 'nodejs' 'npm' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('77e9fefe40997217ae93456b8fd8de5cd78591a34a9738aac86c9b3f0fa39a34')

build() {
    cd "packet-$pkgver"
    
    # Install frontend dependencies
    npm install
    
    # Build frontend
    npm run build
    
    # Build Tauri/Rust backend
    # Use system libssh2 instead of vendored version
    cd src-tauri
    export LIBSSH2_SYS_USE_PKG_CONFIG=1
    cargo build --release --locked
}

package() {
    cd "packet-$pkgver"
    
    # Install binary
    install -Dm755 "src-tauri/target/release/packet" "$pkgdir/usr/bin/$pkgname"
    
    # Install desktop entry
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" << EOF
[Desktop Entry]
Name=Packet
Comment=Terminal multiplexer for network engineers
Exec=packet
Icon=packet
Terminal=false
Type=Application
Categories=Network;System;TerminalEmulator;
Keywords=terminal;ssh;telnet;broadcast;gns3;
EOF
    
    # Install icons
    install -Dm644 "src-tauri/icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
    install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
    install -Dm644 "src-tauri/icons/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
