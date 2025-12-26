# Maintainer: Ernesto Cruz <ernestobritocruz05@gmail.com>
pkgname=packet-term
pkgver=0.1.0
pkgrel=1
pkgdesc="A terminal multiplexer and broadcast system for network engineers with GNS3/EVE-NG integration"
arch=('x86_64')
url="https://github.com/ernestoCruz05/packet"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'openssl')
makedepends=('rust' 'cargo' 'nodejs' 'npm' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed')  # Update this after uploading release
validpgpkeys=('1E5EDD00A4EB7ED5368E03FA0A864F1B71F13D52')

build() {
    cd "$pkgname-$pkgver"
    
    # Install frontend dependencies
    npm install
    
    # Build frontend
    npm run build
    
    # Build Tauri/Rust backend
    cd src-tauri
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    
    # Install binary
    install -Dm755 "src-tauri/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    
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
