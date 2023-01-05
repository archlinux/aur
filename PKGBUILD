# Maintainer: Konsonanz <maximilian.lehmann@protonmail.com>
pkgname=bitburner
pkgver=2.2.1
pkgrel=1
pkgdesc="Bitburner is a programming-based incremental game"
arch=('x86_64')
url="https://github.com/bitburner-official/bitburner-src"
license=('Apache')
depends=('electron')
makedepends=('git' 'npm')
optdepends=('steam: achievement support'
            'steam-native-runtime: achievement support')
source=("git+$url#tag=v$pkgver"
        "bitburner.desktop")
sha256sums=('SKIP'
            'c897102e274fde81015caa4dedd1ad7af56d7eecd19945cecc18b5f559a603e6')

build() {
    cd "bitburner-src"

    npm install
    npm install -C electron

    # TODO: remove this once webpack supports new node crypto behaviour
    # https://github.com/webpack/webpack/issues/14532
    NODE_OPTIONS=--openssl-legacy-provider npm run build

    sh ./tools/package-electron.sh linux
}

package() {
    install -dm 755 "$pkgdir"/{opt,usr/bin}
    cp -dr --no-preserve='ownership' "bitburner-src/.build/bitburner-linux-x64" "$pkgdir/opt/$pkgname"
    ln -s "/opt/$pkgname/resources/app/steam_appid.txt" "$pkgdir/opt/$pkgname/steam_appid.txt"
    ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 "bitburner-src/assets/Steam/logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
    install -Dm644 bitburner.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
