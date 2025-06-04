# Maintainer: Insidious Fiddler <aur[at]codycody31[dot]dev>
pkgname=neohtop
pkgver=1.2.0
pkgrel=1
pkgdesc="💪🏻 htop on steroids"
arch=('x86_64')
url="https://github.com/Abdenasser/neohtop"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1')
makedepends=('rust' 'npm' 'nodejs>=16')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz" "neohtop.desktop" "tauri_version_2.0.3_fix_11615_tauri_apps_tauri.patch")
sha256sums=('055fae3f307ca1b3603467ffe5011babc10b4659de58fe2c69083db3fd46c36b'
            '268edb20d231395da8f724283cd4244facd15ef9564b6705e0324223116eccbc'
            '14f42b97c80dc17af307619ba6132f68b3255c1e0980f530acfcaa616bc28738')

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
