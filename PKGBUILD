# Maintainer: GANPI <some.kind@of.mail>
pkgname=yarc-launcher-bin
_binname=${pkgname%-bin}
pkgver=1.0.0
_appimage=$_binname\_$pkgver\_amd64.AppImage
pkgrel=1
pkgdesc='The official launcher for YARG (a.k.a. Yet Another Launcher or YAL)'
arch=(x86_64)
url=https://github.com/YARC-Official/YARC-Launcher
license=('custom: YARG License')
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
	'hidapi: support for HID devices (in-game)'
	'pulseaudio-alsa: audio support (in-game)'
	'systemd-libs: access to HID devices (in-game)'
)
provides=($_binname)
conflicts=($_binname)
options=(!debug)
source=(
	$url/releases/download/v$pkgver/$_appimage.tar.gz
	https://raw.githubusercontent.com/YARC-Official/YARC-Launcher/master/LICENSE
)
sha256sums=(
	663439bc5ec3d56456d522de135e0e6dce76f9bcf7e6b4001663a076fe4d6ab4
	c4660da2255accdcdee8346b065fc7e4e6b354c5e61d05f3c1c19ff62acd0c01
)

prepare() {
	./$_appimage --appimage-extract

	cd squashfs-root/

	# Add game category and delete comment
	sed -i '2s/$/Game;/; 3d;' $_binname.desktop
}

package() {
	cd squashfs-root/

	# udev rule (in-game)
	install -dm755 $pkgdir/etc/udev/rules.d/

	echo 'KERNEL=="hidraw*", TAG+="uaccess"' > $pkgdir/etc/udev/rules.d/69-hid.rules

	# binary
	install -Dm755 usr/bin/$_binname -t $pkgdir/usr/bin/

	# desktop file
	install -Dm644 $_binname.desktop -t $pkgdir/usr/share/applications/

	# icons
	for _size in 32x32 128x128 256x256@2; do
		_iconpath=usr/share/icons/hicolor/$_size/apps/

		install -Dm644 $_iconpath/$_binname.png -t $pkgdir/$_iconpath/
	done

	# LICENSE
	install -Dm644 $srcdir/LICENSE -t $pkgdir/usr/share/licenses/$_binname/
}