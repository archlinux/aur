# Maintainer: 9M2PJU <9m2pju@hamradio.my>
pkgname=hamrs-9m2pju
_pkgname=hamrs-pro
__pkgname=hamrs
_install_path="/opt/appimages"
pkgver=2.41.1  # Clone this aur and run update.sh to update package version
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

	for _icons in 1024x1024;do
	install -Dm644 "$srcdir/squashfs-root/usr/share/icons/hicolor/$_icons/apps/$_pkgname.png" \
		"$pkgdir/usr/share/icons/hicolor/$_icons/apps/$_pkgname.png"
	done
	install -Dm644 "$srcdir/$_pkgname.png" \
		"$pkgdir/usr/share/icons/hicolor/32x32/apps/$_pkgname.png"

	install -Dm644 "$srcdir/squashfs-root/LICENSE.electron.txt" -t "$pkgdir/usr/share/licenses/$pkgname"
}
