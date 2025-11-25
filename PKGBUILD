# Maintainer: Konsonanz <maximilian.lehmann@protonmail.com>
pkgname=bitburner
pkgver=2.8.1
pkgrel=4
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
            '67afcadd5c5d826303611ad579f7dbbad9446d7ca684ee647ec2242402b361f3')

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
    install -dm755 "$pkgdir"/{opt,usr/bin}
    cp -dr --no-preserve='ownership' "bitburner-src/.build/bitburner-linux-x64" "$pkgdir/opt/$pkgname"
    chmod 755 "$pkgdir/opt/$pkgname"
    ln -s "/opt/$pkgname/resources/app/steam_appid.txt" "$pkgdir/opt/$pkgname/steam_appid.txt"
    ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 "bitburner-src/assets/Steam/logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
    install -Dm644 bitburner.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
