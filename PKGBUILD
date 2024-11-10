# Maintainer: Insidious Fiddler <aur[at]codycody31[dot]dev>
pkgname=neohtop
pkgver=1.1.0
pkgrel=1
pkgdesc="💪🏻 htop on steroids"
arch=('x86_64')
url="https://github.com/Abdenasser/neohtop"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1')
makedepends=('rust' 'npm' 'nodejs>=16')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz" "neohtop.desktop" "tauri_version_2.0.3_fix_11615_tauri_apps_tauri.patch")
sha256sums=('df8ccfd4202aebb8d4d38624075fcd1d9ed4b9b77e5cc436504df28e425ed081'
            '268edb20d231395da8f724283cd4244facd15ef9564b6705e0324223116eccbc'
            '832551fefdd38373ca0e2db8005ca2e16369bc5a95882d095c5c15fe001030a2')

prepare() {
    export HUSKY=0
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
