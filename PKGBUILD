# Maintainer: Timur Bagautdinov <mr.bagautdinov14 at gmail dot com>

pkgname="outertale"
pkgver=5.04
pkgrel=1
epoch=1
pkgdesc="Outertale is an open-source game inspired by Undertale by Toby Fox."
url="https://gitlab.com/spacey_432/spacetime"
license=("custom")
arch=("x86_64")
options=("!debug")
depends=("bash" "electron")
makedepends=("asar" "yarn")
_commit="2f76f76db0f22125bf083ad85ec34abf3f4777a4" # 5.04
source=(
    "$url/-/archive/$_commit/spacetime-master.zip"
    "outertale.desktop"
    "outertale.sh"
)
sha256sums=(
    "73cad7f0ec2339a9335c6aa8a87c4e39d338235bc546b804f22345c2ef320e75"
    "a70911e9e81ebebe89e3dcc5bf2cf814a1e492e74dc053d94a549ca1fcb52546"
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
    install -m 644 "$srcdir/outertale.desktop" "$pkgdir/usr/share/applications/outertale.desktop"
}
