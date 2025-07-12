# Maintainer: 9M2PJU <9m2pju@hamradio.my>
pkgname=hamrs-9m2pju
_pkgname=hamrs-pro
__pkgname=hamrs
_install_path="/opt/appimages"
pkgver=2.41.1  # Clone this AUR and run update.sh to update package version
pkgrel=1
install=hamrs-9m2pju.install
pkgdesc="HAMRS Pro repackaged by 9M2PJU — Portable ham radio logger (AppImage version)"
arch=('x86_64')
url="https://hamrs.app/"
license=('LicenseRef-custom:electron')
depends=('fuse2' 'hicolor-icon-theme' 'zlib' 'hamradio-menus')
provides=('hamrs')
conflicts=('hamrs')
options=(!strip)
source=("https://hamrs-dist.s3.amazonaws.com/$_pkgname-${pkgver}-linux-x86_64.AppImage")
noextract=("$_pkgname-${pkgver}-linux-x86_64.AppImage")
sha256sums=('SKIP')

prepare() {
    chmod a+x "$_pkgname-$pkgver-linux-$arch.AppImage"
    "./$_pkgname-$pkgver-linux-$arch.AppImage" --appimage-extract > /dev/null

    # Fix desktop file to use absolute AppImage path and correct icon reference
    sed -i \
        -e 's|AppRun|/opt/appimages/hamrs-pro.AppImage|g' \
        -e 's|Utility|HamRadio|g' \
        -e 's|Icon=.*|Icon=hamrs-pro|g' \
        "$srcdir/squashfs-root/$_pkgname.desktop"
}

package() {
    # Install AppImage binary
    install -Dm755 "$srcdir/$_pkgname-$pkgver-linux-$arch.AppImage" \
        "$pkgdir/$_install_path/$_pkgname.AppImage"

    # Install .desktop file
    install -Dm644 "$srcdir/squashfs-root/$_pkgname.desktop" \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"

    # Install icons (copy 1024x1024 version as both sizes)
    install -Dm644 "$srcdir/squashfs-root/usr/share/icons/hicolor/1024x1024/apps/hamrs.png" \
        "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/hamrs-pro.png"

    install -Dm644 "$srcdir/squashfs-root/usr/share/icons/hicolor/1024x1024/apps/hamrs.png" \
        "$pkgdir/usr/share/icons/hicolor/32x32/apps/hamrs-pro.png"

    # Install license
    install -Dm644 "$srcdir/squashfs-root/LICENSE.electron.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
}
