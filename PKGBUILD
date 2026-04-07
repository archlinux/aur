# Maintainer: odnmalau <odnmalau@gmail.com>

pkgname=navicat17-premium-en
pkgver=17.3.7
pkgrel=2
pkgdesc="Manage and Develop Your Databases"
arch=('x86_64' 'aarch64')
url='https://www.navicat.com/en/products/navicat-premium'
license=('custom')
source=("navicat17.desktop")
source_x86_64=("navicat17-premium-en-x86_64-${pkgver}.AppImage::https://dn.navicat.com/download/navicat17-premium-en-x86_64.AppImage")
source_aarch64=("navicat17-premium-en-aarch64-${pkgver}.AppImage::https://dn.navicat.com/download/navicat17-premium-en-aarch64.AppImage")

sha256sums=('7b0dbf7ce350724266cc4d4648abd0092a765b013f349aa98fd61d32fe8d8d3e')
sha256sums_x86_64=('6c822a0f085a8c4efe4bf331ee5527dc50b566f45b9399b0c58c2c9842c19517')
sha256sums_aarch64=('d96392c1ece6feeb4768a524b6bb1601fa17cc254ccfe95f6b5c32c7436d5ccb')

package() {
    _root_na_dir=opt/$pkgname
    _na_dir=$pkgdir/$_root_na_dir
    install -d $_na_dir
    cd $srcdir
    chmod +x $srcdir/navicat17-premium-en-$CARCH-${pkgver}.AppImage
    ./navicat17-premium-en-$CARCH-${pkgver}.AppImage --appimage-extract
    cp -r squashfs-root/usr $_na_dir
    install squashfs-root/AppRun $_na_dir
    cp squashfs-root/manual.pdf $_na_dir
    # Avoid loading Navicat's bundled libsystemd on rolling Arch systems.
    # The bundled copy is too old for current util-linux/libmount and causes
    # startup failure before the UI appears.
    rm -f "$_na_dir"/usr/lib/libsystemd.so.0*
    install -d $pkgdir/usr/share/applications
    cp $srcdir/navicat17.desktop $pkgdir/usr/share/applications
    _icon_dir=usr/share/icons/hicolor/256x256/apps
    install -d $pkgdir/$_icon_dir
    ln -s /$_root_na_dir/$_icon_dir/navicat-icon.png $pkgdir/$_icon_dir/navicat17.png
}
