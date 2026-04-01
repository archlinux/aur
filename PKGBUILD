# Maintainer: Gink <ginkcode@gmail.com>
pkgname=gsdb
pkgver=0.3.3
pkgrel=1
pkgdesc="A database management tool for PostgreSQL, MySQL, and SQLite"
arch=('x86_64')
url="https://github.com/ginkcode/gsdb"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libsoup3' 'openssl' 'libssh2' 'libsecret')
makedepends=('rust' 'nodejs' 'npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ginkcode/gsdb/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    npm ci
    npm run build
    unset CARGO_TARGET_DIR
    npm run tauri -- build --config '{"bundle":{"active":false}}'
}

package() {
    cd "$pkgname-$pkgver"
    
    # Install the binary
    install -Dm755 "src-tauri/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    
    # Install desktop entry
    install -Dm644 "pkg/aur/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    
    # Install icons
    install -Dm644 "src-tauri/icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
    install -Dm644 "src-tauri/icons/64x64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"
    install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
    install -Dm644 "src-tauri/icons/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
    install -Dm644 "src-tauri/icons/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}