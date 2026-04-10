# Maintainer: Anton Reshetov

pkgname=masscode
pkgver=5.1.1
_electron_exec=electron34
pkgrel=1
pkgdesc="A free and open source code snippets manager for developers "
arch=("x86_64")
url="https://github.com/massCodeIO/massCode"
license=("AGPL-3.0")
depends=("$_electron_exec")
source=("https://github.com/massCodeIO/massCode/releases/download/v${pkgver}/massCode-${pkgver}.AppImage"
"masscode.png::https://raw.githubusercontent.com/massCodeIO/massCode/master/build/icons/256x256.png"
    "masscode.desktop"
    "masscode.sh"
)
sha256sums=('7de98893bcee6e707b5e0301c294508a66a5337a35f5d1340dd86dcf8baf3d92'
            '61d5876d8cd9560e1c321a219e779111e0a9dc65bee596c459d1494fb4a57bb6'
            'a2e9a02993e1b8efc74fbee597219a84eeb776d41d1dcf0ae9742c2d9fcb9f15'
            '74aad10be03239734f7096833bb5c91c1f0e3d6a9d92bbd38f1d418efcd58b70')

build() {
    sed -i 's#__ROOT_DIR__#/usr/lib/masscode#g' masscode.sh
    sed -i "s#__ELECTRON__#/usr/bin/$_electron_exec#g" masscode.sh
    chmod +x ./massCode-${pkgver}.AppImage
    ./massCode-${pkgver}.AppImage --appimage-extract
}

package() {
    install -d "$pkgdir/usr/lib/masscode/app"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/icons"
    install -d "$pkgdir/usr/share/applications"

    install -m755 masscode.sh "$pkgdir/usr/bin/masscode"
    install -m644 masscode.png "$pkgdir/usr/share/icons/masscode.png"
    install -m644 masscode.desktop "$pkgdir/usr/share/applications/masscode.desktop"

    cd squashfs-root/resources
    find . -type d -exec install -d "$pkgdir/usr/lib/masscode/app/{}" \;
    find . -type f -exec install -m644 "{}" "$pkgdir/usr/lib/masscode/app/{}" \;
}
