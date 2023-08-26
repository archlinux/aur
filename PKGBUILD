# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Sean Snell <ssnell@lakecs.net>
# Submission: not_anonymous <nmlibertarian@gmail.com>

pkgname=hamrs-appimage
_pkgname=hamrs
_install_path="/opt/appimages"
pkgver=1.0.6
pkgrel=1
pkgdesc="Ham Radio portable logger tailored for activities like Parks on the Air, Field Day, and others."
arch=('x86_64')
url="https://hamrs.app/"
license=('custom:electron')
depends=('fuse2' 'hicolor-icon-theme' 'hamradio-menus')
provides=('hamrs')
conflicts=('hamrs')
options=(!strip)
source=("https://$_pkgname-releases.s3.us-east-2.amazonaws.com/$pkgver/$_pkgname-$pkgver-linux-$arch.AppImage")

prepare() {
	chmod a+x "$_pkgname-$pkgver-linux-$arch.AppImage"
	"./$_pkgname-$pkgver-linux-$arch.AppImage" --appimage-extract > /dev/null
	sed 's|AppRun|/opt/appimages/hamrs.AppImage|g;s|Utilities|Utility;HamRadio|g' -i "$srcdir/squashfs-root/$_pkgname.desktop"
}

package() {
	install -Dm755 "$srcdir/$_pkgname-$pkgver-linux-$arch.AppImage" "$pkgdir/$_install_path/$_pkgname.AppImage"
	install -Dm644 "$srcdir/squashfs-root/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

	for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
	install -Dm644 "$srcdir/squashfs-root/usr/share/icons/hicolor/$_icons/apps/$_pkgname.png" \
		"$pkgdir/usr/share/icons/hicolor/$_icons/apps/$_pkgname.png"
	done

	install -Dm644 "$srcdir/squashfs-root/LICENSE.electron.txt" -t "$pkgdir/usr/share/licenses/$pkgname"
}
md5sums=('8ffeb9c5ba99158c94e409c5c5f383d2')
sha256sums=('d234be158780c36cdc4f284bc2aaf775e406e2fde7bd9245d613f60a3b5a1795')
