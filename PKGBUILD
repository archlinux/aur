# Maintainer: Insidious Fiddler <aur[at]codycody31[dot]dev>
pkgname=neohtop
pkgver=1.1.2
pkgrel=1
pkgdesc="💪🏻 htop on steroids"
arch=('x86_64')
url="https://github.com/Abdenasser/neohtop"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1')
makedepends=('rust' 'npm' 'nodejs>=16')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz" "neohtop.desktop" "tauri_version_2.0.3_fix_11615_tauri_apps_tauri.patch")
sha256sums=('6415efdaadc88b3b0c02cd7c3c18a39abd91f01475be72f44ddd5effd112e905'
            '268edb20d231395da8f724283cd4244facd15ef9564b6705e0324223116eccbc'
            '55c75b94c7674ee911e588f10690f2ebedb2985233f5137c1735832accc4d7f9')

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
