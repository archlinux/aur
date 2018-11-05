# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=molotov
pkgver=3.0.0
pkgrel=1
pkgdesc="Streaming access to French (only) TV channels."
arch=('i686' 'x86_64')
url="http://www.molotov.tv/"
license=('unknown')
depends=('fuse' 'gconf' 'desktop-file-utils' 'xdg-utils')
makedepends=('p7zip')
options=('!strip')
source=("Molotov-${pkgver}.AppImage::http://desktop-auto-upgrade.molotov.tv/linux/${pkgver}/$pkgname.AppImage"
        'molotov')
sha256sums=('36c3d7466c6fe2ce3b10d4e73091bd1cd9810b0c91331efb4d7ae0427267f9fa'
            '3a2d0c45ec2a964b229ee44a729d5d86319d573296ca44c8a33e171ce23a3b47')

prepare() {
    cd $srcdir
    chmod u+x Molotov-${pkgver}.AppImage
    ./Molotov-${pkgver}.AppImage --appimage-extract 2> /dev/null
}

build() {
    cd $srcdir
    sed -i "s/Exec=AppRun/Exec=$pkgname/" squashfs-root/molotov.desktop
    sed -i "s/Categories=AudioVideo/Categories=Video;Player;AudioVideo;/" squashfs-root/molotov.desktop

    sed -i "s/MOLOTOV_VERSION/${pkgver}/g" molotov
}

package() {
    cd $srcdir

    install -d -m755 $pkgdir/usr/share/{applications,icons/hicolor}
    install -d -m755 $pkgdir/opt/appimages
    # TODO find a decent license
    #install -d -m755 $pkgdir/usr/share/licenses/$pkgname

    # Only one icon left :/
    install -d -m755 $pkgdir/usr/share/icons/hicolor/256x256/apps
    icon_dir=squashfs-root/usr/share/icons/hicolor/0x0
    install -D -m644 $icon_dir/apps/molotov.png $pkgdir/usr/share/icons/hicolor/256x256/apps/molotov.png

    install -D -m644 squashfs-root/molotov.desktop $pkgdir/usr/share/applications/appimagekit-molotov.desktop
    install -D -m755 molotov $pkgdir/usr/bin/molotov
    install -D -m755 Molotov-$pkgver.AppImage $pkgdir/opt/appimages/Molotov-$pkgver.AppImage
    rm -r squashfs-root
}
