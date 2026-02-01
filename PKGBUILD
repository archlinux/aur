# Maintainer: FrogSnot
pkgname=spent
pkgver=1.1.6
pkgrel=3
pkgdesc="Minimalist personal finance tracker for Linux desktop"
arch=('x86_64')
url="https://github.com/FrogSnot/Spent"
license=('AGPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'librsvg' 'sqlite')
makedepends=('npm' 'rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('90a784ac14812dd9543b9900c0541763f9574a888d8d826a80b2ed1bc58b46a5')

prepare() {
    cd "$srcdir/Spent-$pkgver"
    npm install
}

build() {
    cd "$srcdir/Spent-$pkgver"
    export CARGO_HOME="$srcdir/cargo-home"
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
    npm run build
    cd src-tauri
    cargo build --release
}

package() {
    cd "$srcdir/Spent-$pkgver"
    
    install -Dm755 "src-tauri/target/release/spent-app" "$pkgdir/usr/bin/spent-app"
    
    install -Dm644 "spent.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    
    install -Dm644 "src-tauri/icons/128x128.png" \
        "$pkgdir/usr/share/pixmaps/$pkgname.png"
    
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
