# Maintainer: Jan Keith Certeza Darunday <jkcdarunday@gmail.com>

pkgname=ganache-bin
_pkgname=ganache
pkgver=2.3.2
pkgrel=1
pkgdesc='Personal Blockchain for Ethereum'
arch=('x86_64')
url='https://truffleframework.com/ganache'
license=('MIT')
depends=('nss' 'gtk3' 'libxss' 'libglvnd')
provides=('ganache')
conflicts=('ganache')
source=('ganache.desktop')
source_x86_64=("ganache-$pkgver.AppImage::https://github.com/trufflesuite/ganache/releases/download/v$pkgver/ganache-$pkgver-linux-$arch.AppImage")
sha256sums=('5133e6aa1fd234cdc63b7917d0735b7afd47a96515037695cf026da8c9862938')
sha256sums_x86_64=('bc604c750ef9ce8cab06fcb76fe4d1a666daeadcb1fa9a24b11d0df285ff8b6f')

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
    install -Dm644 *.pak *.bin *.dat *.json $pkgdir/opt/${_pkgname}/

    cp -dr --no-preserve=ownership resources $pkgdir/opt/${_pkgname}/
    cp -dr --no-preserve=ownership locales $pkgdir/opt/${_pkgname}/

    ln -s /opt/${_pkgname}/$_pkgname $pkgdir/usr/bin/$_pkgname

    # Install libraries
    install -Dm644 libffmpeg.so $pkgdir/usr/lib/${_pkgname}/
    install -d "${pkgdir}/etc/ld.so.conf.d"
    echo "/usr/lib/${_pkgname}" > "${pkgdir}/etc/ld.so.conf.d/${_pkgname}.conf"

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
