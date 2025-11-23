# Maintainer: Anton Reshetov

pkgname=masscode
pkgver=4.2.2
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
sha256sums=('00a73bd1cef6669f984883aab568fe1a40d861de0ef8ea7b21455b3daf4937d8'
            'dc0d0519524662fde9e31acadf2ef4c3cf76729c59f8aca306bffe57779e9aa2'
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
