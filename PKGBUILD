# Maintainer: Jan Keith Certeza Darunday <jkcdarunday@gmail.com>

pkgname=ganache-bin
_pkgname=ganache
pkgver=2.1.2
pkgrel=1
pkgdesc='Personal Blockchain for Ethereum'
arch=('x86_64')
url='https://truffleframework.com/ganache'
license=('MIT')
depends=('nss' 'alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst')
provides=('ganache')
conflicts=('ganache')
source=('ganache.desktop')
source_x86_64=("ganache-$pkgver.AppImage::https://github.com/trufflesuite/ganache/releases/download/v$pkgver/ganache-$pkgver-linux-$arch.AppImage")
sha256sums=('5133e6aa1fd234cdc63b7917d0735b7afd47a96515037695cf026da8c9862938')
sha256sums_x86_64=('5e8bea7f30eb5c94a55cb98b99e753746bff00c301095b47212c75a6e38e142a')

prepare() {
    chmod +x ./ganache-$pkgver.AppImage
    ./ganache-$pkgver.AppImage --appimage-extract
}

package() {
    cd $srcdir/squashfs-root

    # Setup directories
    install -d $pkgdir/{usr/share/icons,usr/share/pixmaps,usr/bin,opt/ganache/resources,usr/share/applications}

    # Install the application
    install -Dm755 Ganache $pkgdir/opt/ganache/$_pkgname
    install -Dm644 blink_image_resources_200_percent.pak \
        content_resources_200_percent.pak \
        content_shell.pak \
        icudtl.dat \
        libffmpeg.so \
        libnode.so \
        natives_blob.bin \
        pdf_viewer_resources.pak \
        snapshot_blob.bin \
        ui_resources_200_percent.pak \
        views_resources_200_percent.pak \
        $pkgdir/opt/ganache/

    install -Dm644 resources/app.asar \
        resources/electron.asar \
        resources/app-update.yml \
        $pkgdir/opt/ganache/resources/

    ln -s /opt/ganache/$_pkgname $pkgdir/usr/bin/$_pkgname

    cp -dr --no-preserve=ownership locales $pkgdir/opt/ganache/
    chown -R root:root $pkgdir/opt/ganache/locales
    chmod -R 644 $pkgdir/opt/ganache/locales

    # Install icons and desktop file
    install -Dm644 Ganache.png $pkgdir/usr/share/pixmaps/$_pkgname.png
    cp -dr --no-preserve=ownership usr/share/icons $pkgdir/usr/share/icons
    chown -R root:root $pkgdir/usr/share/icons
    chmod -R 644 $pkgdir/usr/share/icons

    install -Dm644 $srcdir/$_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop
}
