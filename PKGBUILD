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
sha256sums=('dbffe759218e74d2402c25adad9a577355b2c3e50e91d245efef6b866fc2c6aa')

prepare() {
    # Install tauri-cli for proper production builds
    cargo install tauri-cli --locked
}

build() {
    cd "packet-$pkgver"
    
    npm install
    
    cd src-tauri
    export LIBSSH2_SYS_USE_PKG_CONFIG=1
    cargo tauri build --no-bundle
}

package() {
    cd "packet-$pkgver"
    
    install -Dm755 "src-tauri/target/release/packet" "$pkgdir/usr/bin/$pkgname"
    
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
    
    install -Dm644 "src-tauri/icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
    install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
    install -Dm644 "src-tauri/icons/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
    
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
