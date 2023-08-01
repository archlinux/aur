# Maintainer: Jan Keith Darunday <aur@jkcdarunday.mozmail.com>

pkgname=ganache-bin
_pkgname=ganache-ui
pkgver=2.7.1
pkgrel=1
pkgdesc='Personal Blockchain for Ethereum'
arch=('x86_64')
url='https://truffleframework.com/ganache'
license=('MIT')
options=(!strip)
depends=('nss' 'gtk3')
provides=('ganache')
conflicts=('ganache')
source=('ganache-ui.desktop')
source_x86_64=("ganache-$pkgver.AppImage::https://github.com/trufflesuite/ganache-ui/releases/download/v$pkgver/ganache-$pkgver-linux-$arch.AppImage")
sha256sums=('21ed4e6d246c84cdfce1d549180d2a1bd64dcc889e4f503afd0103a158bf55fc')
sha256sums_x86_64=('94f2471986023675690ad205fb6212b1e42078cc43978c49a437137250585c00')

prepare() {
    chmod +x ./ganache-$pkgver.AppImage
    ./ganache-$pkgver.AppImage --appimage-extract
}

package() {
    cd $srcdir/squashfs-root

    # Setup directories
    install -d $pkgdir/{usr/bin,usr/share/icons,usr/share/pixmaps,usr/share/applications,opt/${_pkgname}/resources,usr/lib/${_pkgname}}

    # Install the application
    install -Dm755 Ganache $pkgdir/opt/${_pkgname}/$_pkgname
    install -Dm644 *.so *.pak *.bin *.dat *.json $pkgdir/opt/${_pkgname}/

    cp -dr --no-preserve=ownership resources $pkgdir/opt/${_pkgname}/
    cp -dr --no-preserve=ownership locales $pkgdir/opt/${_pkgname}/

    ln -s /opt/${_pkgname}/$_pkgname $pkgdir/usr/bin/$_pkgname

    # Install icons and desktop file
    install -Dm644 Ganache.png $pkgdir/usr/share/pixmaps/$_pkgname.png
    cp -dr --no-preserve=ownership usr/share/icons $pkgdir/usr/share/
    install -Dm644 $srcdir/$_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop

    # Fix permissions
    chown -R root:root $pkgdir/opt/${_pkgname} $pkgdir/usr/share/icons
    chmod -R 644 $pkgdir/opt/${_pkgname} $pkgdir/usr/share/icons
    chmod 755 $pkgdir/opt/${_pkgname}/${_pkgname}
    find "${pkgdir}/" -type d -exec chmod 755 '{}' \;
}
