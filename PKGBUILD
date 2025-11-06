# Maintainer: metamuffin <metamuffin@disroot.org>

pkgname=hurrycurry-client
pkgver=3.0.1
pkgrel=1
pkgdesc="A game about cooking (client)"
arch=('any')
url="https://codeberg.org/hurrycurry/hurrycurry"
license=('AGPL3')
depends=('godot')
makedepends=('godot' 'ffmpeg')
source=("hurrycurry-$pkgver.tar.gz::https://codeberg.org/hurrycurry/hurrycurry/archive/v$pkgver.tar.gz"
        "hurrycurry-client"
        "hurrycurry-client.desktop")
sha256sums=('6381a8384c0fd2b36f7bb9d8d5269346428c07a7585eb93812200c71ba0899d7'
            '5f695c7f4e2fc8ba6ced19f54bb244ab056bcff565adb56855a85fe2c3149fc5'
            '2607233a774b1f74f10deb0ef1c594e418554c4b5701d0e700016368e6d59718')

build() {
    cd "hurrycurry"
    make all_client
    git reset --hard
    sed -i "s/^const DISTRIBUTION := .*/const DISTRIBUTION := \"arch\"/" client/global.gd
    sed -i "s/^const VERSION := .*/const VERSION := \"$pkgver-$pkgrel\"/" client/global.gd
    mkdir -p target/release
    godot --headless --export-pack wasm32-unknown-unknown ../target/release/client.pck client/project.godot
}
package() {
    install -Dm755 hurrycurry-client "$pkgdir/usr/bin/hurrycurry-client"
    install -Dm644 hurrycurry-client.desktop "$pkgdir/usr/share/applications/hurrycurry-client.desktop"
    install -Dm644 hurrycurry/target/release/client.pck "$pkgdir/usr/share/hurrycurry/client.pck"
    install -Dm644 hurrycurry/COPYING "$pkgdir/usr/share/licenses/hurrycurry-client/COPYING"
    install -Dm644 hurrycurry/client/icons/main.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/hurrycurry.png"
}
