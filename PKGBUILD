# Maintainer: Insidious Fiddler <aur[at]codycody31[dot]dev>
pkgname=neohtop
pkgver=1.0.9
pkgrel=1
pkgdesc="💪🏻 htop on steroids"
arch=('x86_64')
url="https://github.com/Abdenasser/neohtop"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1')
makedepends=('rust' 'npm' 'nodejs>=16')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz" "neohtop.desktop" "tauri_version_2.0.3_fix_11615_tauri_apps_tauri.patch")
sha256sums=('5970e70c5c34ccd40c9b531d65271ad16d5e5874829d3458019934a9a95611c9'
            '268edb20d231395da8f724283cd4244facd15ef9564b6705e0324223116eccbc'
            'f627bd694dc07a114d339eaa829819fe821d876927f69303f4136ba6ce62e364')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    patch -p1 < "$srcdir/tauri_version_2.0.3_fix_11615_tauri_apps_tauri.patch"

    npm install
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
