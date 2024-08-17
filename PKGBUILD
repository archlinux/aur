# Maintainer: Timur Bagautdinov <mr.bagautdinov14 at gmail dot com>

pkgname="outertale"
pkgver=50.2
pkgrel=1
pkgdesc="Outertale is an open-source game inspired by Undertale by Toby Fox."
url="https://gitlab.com/spacey_432/spacetime"
license=("custom")
arch=("x86_64")
options=("!debug")
depends=("bash" "electron")
makedepends=("asar" "yarn")
_commit="6f4e64f98a59421c48dcae0752535b2c9019996a" # 50.2
source=(
    "$url/-/archive/$_commit/spacetime-master.zip"
    "Outertale.desktop"
    "outertale.sh"
)
sha256sums=(
    "c2222bcffa6e81bd43f2d14798bbca7a7b2be8dbac47dd8b407d8d0362cb5c70"
    "97a7b2cb5a2330ea9773b967c91b834ef1c979c2b41c6a03d5adeef966155a50"
    "bf0de08cb414d9e8c1b668d8add0e7ad33b4114d4d1c3777a301623be6c3dde8"
)

build() {
    cd "$srcdir/spacetime-$_commit"
    if [ ! -d "node_modules" ]; then yarn install; fi

    rm -rf "app/dist/assets"
    yarn build-assets &
    rm -rf "app/code"
    yarn build-types

    cd "app/dist"
    rm -rf asar
    mkdir asar
    cp -r assets ../code ../index.js ../package.json ../preload.js ../spacetime.js ../icon.png asar
    asar pack asar app.asar
}

package() {
    install -d "$pkgdir/usr/bin/"
    install -d "$pkgdir/usr/share/pixmaps/"
    install -d "$pkgdir/usr/share/applications/"
    install -d "$pkgdir/usr/share/$pkgname"

    # Game
    install -m 644 "$srcdir/spacetime-$_commit/app/dist/app.asar" "$pkgdir/usr/share/$pkgname/app.asar"

    # Shell script
    install -m 755 "$srcdir/outertale.sh" "$pkgdir/usr/bin/outertale"

    # Icon
    install -m 644 "$srcdir/spacetime-$_commit/app/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

    # XDG file
    install -m 644 "$srcdir/Outertale.desktop" "$pkgdir/usr/share/applications/Outertale.desktop"
}
