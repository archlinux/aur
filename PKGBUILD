# Maintainer: Konsonanz <maximilian.lehmann@protonmail.com>
pkgname=bitburner
pkgver=1.5.0
pkgrel=1
pkgdesc="Bitburner is a programming-based incremental game"
arch=('x86_64')
url="https://github.com/danielyxie/bitburner"
license=('custom')
depends=('electron')
makedepends=('git' 'npm')
optdepends=('steam: achievement support'
            'steam-native-runtime: achievement support')
_commit=8358e62fb0229a7183e66890b3c92d9848a3af2a  # 1.5, current master
source=("git+$url#commit=$_commit"
        "bitburner.desktop")
sha256sums=('SKIP'
            '475d10bd934a85f5487f5359a5843fdb6f0dff03d8a88c4c81cba45b4cb07114')

build() {
    cd "$pkgname"

    npm install
    npm -C electron install
    npm run build

    ./package.sh linux
}

package() {
    install -dm 755 "$pkgdir"/{opt,usr/bin}
    cp -dr --no-preserve='ownership' "$pkgname/.build/$pkgname-linux-x64" "$pkgdir/opt/$pkgname"
    ln -s "/opt/$pkgname/resources/app/steam_appid.txt" "$pkgdir/opt/$pkgname/steam_appid.txt"
    ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 "$pkgname"/license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$pkgname"/assets/Steam/logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
    install -Dm644 bitburner.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
