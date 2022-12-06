# Maintainer: Konsonanz <maximilian.lehmann@protonmail.com>
pkgname=bitburner
pkgver=2.2.0
pkgrel=1
pkgdesc="Bitburner is a programming-based incremental game"
arch=('x86_64')
url="https://github.com/bitburner-official/bitburner-src"
license=('Apache')
depends=('electron')
makedepends=('git' 'npm')
optdepends=('steam: achievement support'
            'steam-native-runtime: achievement support')
_commit='680027cd4b7b4c0fb6638d6a5e821e99d8189159'  # v2.2.0
source=("git+$url#commit=$_commit"
        "bitburner.desktop")
sha256sums=('SKIP'
            '12a0f945c2dfebb42f5fbcf9b668173d37d51a0b1db05ca81d13a20da92d1d70')

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
