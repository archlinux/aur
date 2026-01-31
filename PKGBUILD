# Maintainer: FrogSnot
pkgname=spent
pkgver=1.1.2
pkgrel=1
pkgdesc="Minimalist personal finance tracker for Linux desktop"
arch=('x86_64')
url="https://github.com/FrogSnot/Spent"
license=('AGPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'librsvg')
makedepends=('npm' 'rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c5446ec354ce03c64559694ac6dac2db6aa511eef8300e7d5478f5fc9f21eb4a')

prepare() {
    cd "$srcdir/Spent-$pkgver"
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=0
    npm install
}

build() {
    cd "$srcdir/Spent-$pkgver"
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=0
    cargo clean -p libsqlite3-sys || true
    npm run tauri build
}

package() {
    cd "$srcdir/Spent-$pkgver"
    
    # Install binary
    install -Dm755 "src-tauri/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    
    # Install desktop file
    install -Dm644 "src-tauri/target/release/bundle/deb/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop" 2>/dev/null || true
    
    # Install icon
    install -Dm644 "src-tauri/icons/128x128.png" \
        "$pkgdir/usr/share/pixmaps/$pkgname.png"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
