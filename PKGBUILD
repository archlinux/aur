# Maintainer: Konsonanz <maximilian.lehmann@protonmail.com>
pkgname=bitburner
pkgver=1.4.0
pkgrel=3
pkgdesc="Bitburner is a programming-based incremental game"
arch=('x86_64')
url="https://github.com/danielyxie/bitburner"
license=('custom')
depends=('electron')
makedepends=('git' 'npm')
optdepends=('steam: achievement support'
            'steam-native-runtime: achievement support')
_commit=16b959338bdbf363dae42aa6e116e65491acafea  # 1.4, current master
source=("git+$url#commit=$_commit"
        "bitburner.desktop")
sha256sums=('SKIP'
            '475d10bd934a85f5487f5359a5843fdb6f0dff03d8a88c4c81cba45b4cb07114')

build() {
    cd "$pkgname"

    # Buildsteps as taken from package.sh in the repo
    npm install
    npm -C electron install
    npm run build

    mkdir -p .package/dist/src/ThirdParty || true
    mkdir -p .package/src/ThirdParty || true
    mkdir -p .package/node_modules || true

    cp index.html .package
    cp -r electron/* .package
    cp -r dist/ext .package/dist
    cp -r dist/icons .package/dist

    cp dist/vendor.css .package/dist
    cp main.css .package/main.css

    cp dist/vendor.bundle.js .package/dist/vendor.bundle.js
    cp main.bundle.js .package/main.bundle.js

    cp dist/vendor.bundle.js.map .package/dist/vendor.bundle.js.map
    cp main.bundle.js.map .package/main.bundle.js.map

    npm exec electron-packager -- .package "$pkgname" \
--platform=linux \
--arch=x64 \
--out .build \
--overwrite \
--icon .package/icon.png \
--no-prune
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
