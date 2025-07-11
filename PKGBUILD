# Maintainer: 9M2PJU <9m2pju@hamradio.my>
pkgname=hamrs-9m2pju
_pkgname=hamrs-pro
__pkgname=hamrs
_install_path="/opt/appimages"
pkgver=2.41.1  # Will be auto-updated
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
    sed 's|AppRun|/opt/appimages/hamrs-pro.AppImage|g;s|Utility|HamRadio|g' -i "$srcdir/squashfs-root/$_pkgname.desktop"
}

package() {
    install -Dm755 "$srcdir/$_pkgname-$pkgver-linux-$arch.AppImage" "$pkgdir/$_install_path/$_pkgname.AppImage"
    install -Dm644 "$srcdir/squashfs-root/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

    # Install all available icon sizes
    for size in 16 32 48 64 128 256 512 1024; do
        iconpath="$srcdir/squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/$_pkgname.png"
        if [[ -f "$iconpath" ]]; then
            install -Dm644 "$iconpath" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$_pkgname.png"
        fi
    done

    install -Dm644 "$srcdir/squashfs-root/LICENSE.electron.txt" -t "$pkgdir/usr/share/licenses/$pkgname"
}
