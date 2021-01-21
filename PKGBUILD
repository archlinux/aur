# Gulden-appimage: The Gulden Wallet in an AppImage.
# Just as the Upwork-appimage package, we use /opt/appimages as the `install` location.
# Maintainer: geekmar <geekmar2002@gmail.com>

_pkgname=gulden
_upkgname=Gulden
pkgname=gulden-appimage
pkgver=2.3.0.4
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

md5sums_i686=('7bae0a70d55718b37f1a095e099fd693'
              'bdf81783df82ac7c4fe8c41178df9000')
md5sums_x86_64=('36d81d5a02808917b35ad10bc3c63fb3'
                'e8d08ee9238cce7d2d499c1512ea7bc2')


prepare() {
    cd "${srcdir}"

    # Extract relevant files from AppImage, redirect to /dev/null to avoid spamming the terminal
    7z x -y "${srcdir}/$_upkgname-$pkgver-$CARCH.AppImage" usr/share/icons > /dev/null
    7z x -y "${srcdir}/$_upkgname-$pkgver-$CARCH.AppImage" $_pkgname.png > /dev/null
    7z x -y "${srcdir}/$_upkgname-$pkgver-$CARCH.AppImage" $_pkgname.desktop > /dev/null

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
