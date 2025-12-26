# Maintainer: Ernesto Cruz <ernestobritocruz05@gmail.com>
pkgname=packet-term
pkgver=0.1.0
pkgrel=2
pkgdesc="A terminal multiplexer and broadcast system for network engineers with GNS3/EVE-NG integration"
arch=('x86_64')
url="https://github.com/ernestoCruz05/packet"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'openssl' 'libssh2' 'cairo' 'gdk-pixbuf2' 'glib2' 'hicolor-icon-theme' 'pango')
makedepends=('rust' 'cargo' 'nodejs' 'npm' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7ffb0faaf931378e4f8f82332e773c78045015cfe75bff897f5d9631d5e61d0b')

prepare() {
    cd "packet-$pkgver"
    npm install
}

build() {
    cd "packet-$pkgver"
    export LIBSSH2_SYS_USE_PKG_CONFIG=1
    npx tauri build -b deb
}

package() {
    cd "packet-$pkgver"
    
    # Install binary (rename from 'packet' to 'packet-term')
    install -Dm755 "src-tauri/target/release/bundle/deb/packet_${pkgver}_amd64/data/usr/bin/packet" \
        "$pkgdir/usr/bin/$pkgname"
    
    # Install desktop entry (rename to packet-term and fix Exec)
    install -Dm644 "src-tauri/target/release/bundle/deb/packet_${pkgver}_amd64/data/usr/share/applications/packet.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i "s/Exec=packet/Exec=$pkgname/" "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i "s/Icon=packet/Icon=$pkgname/" "$pkgdir/usr/share/applications/$pkgname.desktop"
    
    # Install icons (rename to packet-term)
    install -Dm644 "src-tauri/target/release/bundle/deb/packet_${pkgver}_amd64/data/usr/share/icons/hicolor/32x32/apps/packet.png" \
        "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
    install -Dm644 "src-tauri/target/release/bundle/deb/packet_${pkgver}_amd64/data/usr/share/icons/hicolor/128x128/apps/packet.png" \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
    install -Dm644 "src-tauri/target/release/bundle/deb/packet_${pkgver}_amd64/data/usr/share/icons/hicolor/256x256@2/apps/packet.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
