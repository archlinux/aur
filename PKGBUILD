# Maintainer: Insidious Fiddler <aur[at]codycody31[dot]dev>
pkgname=neohtop
pkgver=1.1.1
pkgrel=1
pkgdesc="💪🏻 htop on steroids"
arch=('x86_64')
url="https://github.com/Abdenasser/neohtop"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1')
makedepends=('rust' 'npm' 'nodejs>=16')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz" "neohtop.desktop" "tauri_version_2.0.3_fix_11615_tauri_apps_tauri.patch")
sha256sums=('78d0e4a0f7be98b2b56c57ae0265ccc914baf6652d10d3877c8fe476c86e14ef'
            '268edb20d231395da8f724283cd4244facd15ef9564b6705e0324223116eccbc'
            '0fd580d893dc78b3382a1002f87fc181e11734ad85236de6a3286d1bc47a4d09')

prepare() {
    export HUSKY=0
    cd "$srcdir/$pkgname-$pkgver"
    patch -p1 < "$srcdir/tauri_version_2.0.3_fix_11615_tauri_apps_tauri.patch"
    npm ci
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    npm run tauri build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "src-tauri/target/release/NeoHtop" "$pkgdir/usr/bin/neohtop"
    install -Dm644 "$srcdir/neohtop.desktop" "$pkgdir/usr/share/applications/neohtop.desktop"
    install -Dm644 "src-tauri/icons/icon.png" "$pkgdir/usr/share/pixmaps/neohtop.png"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
