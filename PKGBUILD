# Maintainer: Clément Vicart <clem.vicart@gmail.com>
pkgname=dofus-launcher
pkgver=3.0
pkgrel=1
pkgdesc="Official Dofus setup and launcher"
arch=('x86_64')
url="https://www.dofus.com/en/mmorpg/download"
license=('LicenseRef-dofus-license')
depends=('bash' 'alsa-lib' 'nss' 'java-runtime' 'gtk3')
optdepends=('libnotify' 'libappindicator' 'libindicator')
makedepends=('fuse2')
source=("${pkgname}-${pkgver}.AppImage::https://launcher.cdn.ankama.com/installers/production/Dofus%20${pkgver}-Setup-$CARCH.AppImage"
	"LICENSE"
	"zaap.desktop.patch"
	"dofus-launcher.sh")
sha256sums=("756a4163ff1c9504f5ea520f511fb2df8e8cc11b073d4d0ce22aff13d06aa701"
	"25faf31f7f6b1707380ae13772cf02d52e92863d4eca10b38f0beabf960df564"
	"4f8ae8f15f3cab577f6046a19eb86a17da11ff56eb0456e377deb7606cbeba3c"
	"9b8f372d62fb6b1913f7b3d31ec7ced8b26ef1a5c5dfc49e5a9a022685ce6c28")

prepare() {
	mkdir $srcdir/extract
	chmod +x $pkgname-$pkgver.AppImage
	mv $pkgname-$pkgver.AppImage $srcdir/extract
	cd $srcdir/extract
	./$pkgname-$pkgver.AppImage --appimage-extract
	mv $srcdir/zaap.desktop.patch $srcdir/extract/squashfs-root
	cd squashfs-root
	patch < zaap.desktop.patch
	rm zaap.desktop.patch
	
}

package() {
	RES_DIR="$srcdir/extract/squashfs-root"
	
	install -d $pkgdir/opt/dofus-launcher
	install -d $pkgdir/usr/share/licenses/dofus-launcher
	install -d $pkgdir/usr/share/icons/hicolor/
	install -d $pkgdir/usr/share/applications
	install -d $pkgdir/usr/bin

	cp -R $RES_DIR/* $pkgdir/opt/dofus-launcher
	chmod -R 755 $pkgdir/opt/dofus-launcher
	
	install -m 755 dofus-launcher.sh $pkgdir/usr/bin/dofus-launcher

	install -m 644 $RES_DIR/zaap.desktop $pkgdir/usr/share/applications/dofus-launcher.desktop
	cp -R $RES_DIR/usr/share/icons/hicolor/* $pkgdir/usr/share/icons/hicolor/
	chmod -R 755 $pkgdir/usr/share/icons/hicolor

	install -m 644 LICENSE $pkgdir/usr/share/licenses/dofus-launcher/LICENSE
	install -m 644 $RES_DIR/LICENSE.electron.txt $pkgdir/usr/share/licenses/dofus-launcher/LICENSE.electron.txt
	install -m 644 $RES_DIR/LICENSES.chromium.html $pkgdir/usr/share/licenses/dofus-launcher/LICENSES.chromium.html
}
