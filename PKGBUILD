# Maintainer: metamuffin <metamuffin@disroot.org>

pkgname=hurrycurry-client
pkgver=3.1.1
pkgrel=1
pkgdesc="A game about cooking (client)"
arch=('any')
url="https://codeberg.org/hurrycurry/hurrycurry"
license=('AGPL3')
depends=('godot')
makedepends=('godot' 'ffmpeg')
source=("hurrycurry-$pkgver.tar.gz::https://codeberg.org/hurrycurry/hurrycurry/archive/v$pkgver.tar.gz"
        "hurrycurry-client")
sha256sums=('d0c4fd51128deced60f115e9e3e61c8170be4c3ebd79439b7a9ab3e91e861a64'
            '5f695c7f4e2fc8ba6ced19f54bb244ab056bcff565adb56855a85fe2c3149fc5')

build() {
    cd "hurrycurry"
    sed -i "s/^const DISTRIBUTION := .*/const DISTRIBUTION := \"arch\"/" client/global.gd
    sed -i "s/^const VERSION := .*/const VERSION := \"$pkgver-$pkgrel\"/" client/global.gd
    make all_client
    make misc/hurrycurry.desktop misc/hurrycurry.metainfo.xml
    sed -i "s/^Exec=hurrycurry/Exec=hurrycurry-client/" misc/hurrycurry.desktop
    mkdir -p target
    for size in {32,64,128,256,512}; do
        ffmpeg -i client/icons/main.png -vf "scale=${size}:${size}" -y "target/icon-$size.png"
    done
}
package() {
    install -Dm755 hurrycurry-client "$pkgdir/usr/bin/hurrycurry-client"
    install -Dm644 hurrycurry/misc/hurrycurry.desktop "$pkgdir/usr/share/applications/hurrycurry-client.desktop"
    install -Dm644 hurrycurry/misc/hurrycurry.metainfo.xml "$pkgdir/usr/share/metainfo/hurrycurry-client.metainfo.xml"
    install -Dm644 hurrycurry/client/client.pck "$pkgdir/usr/share/hurrycurry/client.pck"
    install -Dm644 hurrycurry/COPYING "$pkgdir/usr/share/licenses/hurrycurry-client/COPYING"
    for size in {32,64,128,256,512}; do
        install -Dm644 "hurrycurry/target/icon-$size.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/hurrycurry.png"
    done
}
