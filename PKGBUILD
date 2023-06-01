# Maintainer: Konsonanz <maximilian.lehmann@protonmail.com>
pkgname=bitburner
pkgver=2.3.0
pkgrel=2
pkgdesc="Bitburner is a programming-based incremental game"
arch=('x86_64')
url="https://github.com/bitburner-official/bitburner-src"
license=('Apache')
depends=('electron')
makedepends=('git' 'npm')
optdepends=('steam: achievement support'
            'steam-native-runtime: achievement support')
_commit='79bd057aa24d166f25292b0b84e04302edacb3d2'  # latest stable
source=("git+$url#commit=$_commit"
        "bitburner.desktop")
sha256sums=('SKIP'
            '01c67a339dabe141e1c5a90d6e229c530349ac3ab4123a5f0a0b86b327e992ab')

build() {
    cd "bitburner-src"

    # Cannot use ./tools/package-electron.sh here since it builds for
    # all targets and archs; no linux-only support yet (again)
    mkdir .package
    npm install
    npm install -C electron
    npm run build
    cp -r .app/* electron/* .package

    npx electron-packager .package bitburner --out .build --overwrite --icon .package/icon.png
}

package() {
    install -dm 755 "$pkgdir"/{opt,usr/bin}
    cp -dr --no-preserve='ownership' "bitburner-src/.build/bitburner-linux-x64" "$pkgdir/opt/$pkgname"
    ln -s "/opt/$pkgname/resources/app/steam_appid.txt" "$pkgdir/opt/$pkgname/steam_appid.txt"
    ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 "bitburner-src/assets/Steam/logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
    install -Dm644 bitburner.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
