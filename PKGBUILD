# Gulden-appimage: The Gulden Wallet in an AppImage.
# Just as the Upwork-appimage package, we use /opt/appimages as the `install` location.
# Maintainer: Lamelos <lamelos plus aur at gmail dot com>

_pkgname=gulden
_upkgname=Gulden
pkgname=gulden-appimage
pkgver=1.6.4.8
pkgrel=1
pkgdesc="Gulden Cryptocurrency Wallet (AppImage)"
arch=('i686' 'x86_64')
url="https://github.com/Gulden/gulden-official"
license=('unknown')
conflicts=('gulden-bin')
makedepends=('p7zip')
noextract=("$_pkgname-$pkgver.AppImage")
options=('!strip')

source_x86_64=("https://github.com/Gulden/gulden-official/releases/download/v$pkgver/Gulden-$pkgver-x86_64.AppImage"
               "$_pkgname-x86_64.desktop.patch")
source_i686=("https://github.com/Gulden/gulden-official/releases/download/v$pkgver/Gulden-$pkgver-i686.AppImage"
                "$_pkgname-i686.desktop.patch")

md5sums_i686=('2623ed385994053412707803eacfd129'
              '91e656fdf7144613b7a4933b1870c821')
md5sums_x86_64=('ad4f2d4335006582ec774673535e3d88'
                'f13005ff95825aac6595c43b5c776195')


prepare() {
    cd "${srcdir}"

    7z x -y "${srcdir}/$_upkgname-$pkgver-$CARCH.AppImage" usr/share/icons
    7z x -y "${srcdir}/$_upkgname-$pkgver-$CARCH.AppImage" $_pkgname.png
    7z x -y "${srcdir}/$_upkgname-$pkgver-$CARCH.AppImage" $_pkgname.desktop

    # Patch desktop file
    patch -p1 < $_pkgname-$CARCH.desktop.patch
}

package() {
    cd "${srcdir}"
    
    # Copy all icons
    install -dm755 "$pkgdir"/usr/share/icons
    cp -dpr --no-preserve=ownership "usr/share/icons" "$pkgdir"/usr/share

    # Set correct permissions for icons
    chmod -R 755 "$pkgdir"/usr/share/icons

    # Prevent asking for desktop integration
    install -dm755 "$pkgdir"/usr/share/appimagekit
    touch "$pkgdir/usr/share/appimagekit/$_upkgname"_no_desktopintegration

    install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
    install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm755 "$_upkgname-$pkgver-$CARCH.AppImage" "$pkgdir"/opt/appimages/$_upkgname-$pkgver-$CARCH.AppImage
}
