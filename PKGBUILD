# Maintainer: Konsonanz <maximilian.lehmann@protonmail.com>
pkgname=bitburner
pkgver=2.3.1
pkgrel=1
pkgdesc="Bitburner is a programming-based incremental game"
arch=('x86_64')
url="https://github.com/bitburner-official/bitburner-src"
license=('Apache')
depends=('electron')
makedepends=('git' 'npm')
optdepends=('steam: achievement support'
            'steam-native-runtime: achievement support')
_commit='100030008069cacfce565ecf8c69da157e9ad180'  # latest stable
source=("git+$url#commit=$_commit"
        "bitburner.desktop")
sha256sums=('SKIP'
            '45c8e6a71b193aa0e57794a50e0b6f1b6188619b90d8f6df370eee8d5cee49d6')

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
