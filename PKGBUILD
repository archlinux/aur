# Maintainer: bemxio <bemxiov@protonmail.com>

pkgname="tenacity-bin"
pkgdesc="An easy-to-use multi-track audio editor and recorder, forked from Audacity"

pkgver=1.3.3
pkgrel=2

arch=(i686 x86_64)

url="https://tenacityaudio.org"
license=("GPL2" "CCPL")

depends=(fuse2 jack2)
makedepends=()

provides=(tenacity)
conflicts=(tenacity tenacity-git)

source=("https://codeberg.org/tenacityteam/tenacity/releases/download/v${pkgver}/tenacity-linux-v${pkgver}.AppImage")
md5sums=("f18dd15d2f357c362c0edf7e7d7b52a2")

options=(!strip)

prepare() {
    # make the AppImage executable
    chmod +x "./tenacity-linux-v${pkgver}.AppImage"

    # extract the `share` directory from the AppImage
    "./tenacity-linux-v${pkgver}.AppImage" --appimage-extract share

    # delete the `glib-2.0` directory
    rm -rf squashfs-root/share/glib-2.0
}

package() {
    # create the required directories
    mkdir -p "${pkgdir}/usr/share"
    mkdir -p "${pkgdir}/usr/bin"

    # copy the AppImage launcher to `/opt/tenacity`
    install -Dm755 "../tenacity-linux-v${pkgver}.AppImage" "${pkgdir}/opt/tenacity/tenacity.AppImage"

    # copy the bundled `share` directory to `/usr/share`
    cp -r squashfs-root/share "${pkgdir}/usr/"

    # make a symlink to the AppImage launcher
    ln -s /opt/tenacity/tenacity.AppImage "${pkgdir}/usr/bin/tenacity"
}