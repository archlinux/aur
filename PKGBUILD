# Maintainer: Konsonanz <maximilian.lehmann@protonmail.com>
pkgname=bitburner
pkgver=2.1.0
pkgrel=1
pkgdesc="Bitburner is a programming-based incremental game"
arch=('x86_64')
url="https://github.com/danielyxie/bitburner"
license=('Apache')
depends=('electron')
makedepends=('git' 'npm')
optdepends=('steam: achievement support'
            'steam-native-runtime: achievement support')
_commit='2d9a12202f00c85583f95b39fa3755104cb4cc3d'  # latest master
source=("git+$url#commit=$_commit"
        "bitburner.desktop")
sha256sums=('SKIP'
            '385174cee5da60bf403cfff6d44929df2639fb4097a159c9ba7eded690cdd288')

build() {
    cd "$pkgname"

    npm install
    npm -C electron install
    npm run build

    sh ./tools/package-electron.sh linux
}

package() {
    install -dm 755 "$pkgdir"/{opt,usr/bin}
    cp -dr --no-preserve='ownership' "$pkgname/.build/$pkgname-linux-x64" "$pkgdir/opt/$pkgname"
    ln -s "/opt/$pkgname/resources/app/steam_appid.txt" "$pkgdir/opt/$pkgname/steam_appid.txt"
    ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 "$pkgname"/assets/Steam/logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
    install -Dm644 bitburner.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
