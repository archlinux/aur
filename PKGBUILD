# Maintainer: FrogSnot
pkgname=spent
pkgver=1.1.5
pkgrel=1
pkgdesc="Minimalist personal finance tracker for Linux desktop"
arch=('x86_64')
url="https://github.com/FrogSnot/Spent"
license=('AGPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'librsvg')
makedepends=('npm' 'rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('867d9f64c747cd3c05d4c3473c5a35791e661f40b18b4d7009aabd99c7873e42')

prepare() {
    cd "$srcdir/Spent-$pkgver"
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=0
    npm install
}

build() {
    cd "$srcdir/Spent-$pkgver"
    export CARGO_HOME="$srcdir/cargo-home"
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=0
    npm run tauri build
}

package() {
    cd "$srcdir/Spent-$pkgver"
    
    install -Dm755 "src-tauri/target/release/spent-app" "$pkgdir/usr/bin/spent-app"
    
    install -Dm644 "src-tauri/target/release/bundle/deb/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop" 2>/dev/null || true
    
    install -Dm644 "src-tauri/icons/128x128.png" \
        "$pkgdir/usr/share/pixmaps/$pkgname.png"
    
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
