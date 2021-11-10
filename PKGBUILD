# Maintainer: fsociety3765 <fsociety3765 at gmail dot com>

pkgname=joplin-desktop-bin
pkgver=2.5.12
pkgrel=1
pkgdesc='An open source note taking and to-do application with synchronization capabilities for Windows, macOS, Linux, Android and iOS'
arch=('x86_64')
url='https://joplinapp.org'
license=('MIT')
depends=('hicolor-icon-theme')
makedepends=('asar')
options=(!strip)
provides=('joplin-desktop')
conflicts=('joplin-desktop')
install="$pkgname.install"
source=("joplin-desktop.sh")
sha256sums=('6b6c0c40685ded41316351d7ced34c33107d0401ee29729be1dadb3ba5e859da')
source_x86_64=("Joplin-$pkgver.AppImage::https://github.com/laurent22/joplin/releases/download/v$pkgver/Joplin-$pkgver.AppImage")
sha512sums_x86_64=('152d8b69c6d1e5317b70e9d30d6b26e4fb28faed3709baddf9dc3c2b37f10ed45607b15544eb56164cae994992666db23c388e672bb683ebecf82d1cd21d4f3f')

prepare() {
	chmod +x "Joplin-$pkgver.AppImage"
	"./Joplin-$pkgver.AppImage" --appimage-extract 2>&1 >/dev/null
	asar e squashfs-root/resources/app.asar squashfs-root/resources/app
	rm squashfs-root/resources/{app.asar,app-update.yml}
}

package() {
	install -d "$pkgdir/opt/$pkgname/"
	chmod -R 755 squashfs-root/{usr,locales,resources,swiftshader}
	cp -a --no-preserve=ownership squashfs-root/* "$pkgdir/opt/$pkgname/"

	install -Dm 755 "joplin-desktop.sh" "$pkgdir/usr/bin/joplin-desktop"
	install -d "$pkgdir/usr/share/icons/hicolor/512x512/apps/"
	install -d "$pkgdir/usr/share/applications/"

	sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/joplin-desktop|" "$pkgdir/opt/$pkgname/@joplinapp-desktop.desktop"
	ln -s "/opt/$pkgname/@joplinapp-desktop.desktop" "$pkgdir/usr/share/applications/"
	ln -s "/opt/$pkgname/@joplinapp-desktop.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/"
}
