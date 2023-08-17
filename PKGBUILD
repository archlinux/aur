# Maintainer: GANPI <some.kind@of.mail>
pkgname=yarc-launcher
pkgver=0.2.1
_appimage=${pkgname}_${pkgver}_amd64.AppImage
pkgrel=2
pkgdesc="The official launcher for YARG (a.k.a. Yet Another Launcher or YAL)"
arch=(x86_64)
url=https://github.com/YARC-Official/YARC-Launcher
license=("custom: YARG License")
depends=(
	cairo
	gdk-pixbuf2
	glib2
	gtk3
	hicolor-icon-theme
	libsoup
	openssl-1.1
	pango
	webkit2gtk
)
optdepends=(
	"hidapi: support for HID devices in-game"
	"systemd-libs: udev services in-game"
)
source=(
	$url/releases/download/v$pkgver/$_appimage.tar.gz
	https://raw.githubusercontent.com/YARC-Official/YARC-Launcher/master/LICENSE
)
sha256sums=(
	1d37c36b788a71cbc167ed2e8ac692bc73167dbad0790215e4721009735e43c4
	c4660da2255accdcdee8346b065fc7e4e6b354c5e61d05f3c1c19ff62acd0c01
)

prepare() {
	./$_appimage --appimage-extract

	cd squashfs-root/

	# Add game category and remove comment
	sed -i "2s/$/Game;/; 3s/A Tauri App//; 9d" $pkgname.desktop
}

package() {
	cd squashfs-root/

	# 69-hid.rules
	install -dm755 $pkgdir/etc/udev/rules.d/

	echo 'KERNEL=="hidraw*", TAG+="uaccess"' > $pkgdir/etc/udev/rules.d/69-hid.rules

	# binary
	install -Dm755 usr/bin/$pkgname -t $pkgdir/usr/bin/

	# .desktop
	install -Dm644 $pkgname.desktop -t $pkgdir/usr/share/applications/

	# icons
	for _size in 32x32 128x128 256x256@2; do
		_iconpath=usr/share/icons/hicolor/$_size/apps

		install -Dm644 $_iconpath/$pkgname.png -t $pkgdir/$_iconpath/
	done

	# LICENSE
	install -Dm644 $srcdir/LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
}