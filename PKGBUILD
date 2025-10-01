# Maintainer: GANPI <some.kind@of.mail>
pkgname=yarc-launcher-bin
_binname=${pkgname%-bin}
pkgver=1.2.0
_appimage=YARC.Launcher\_$pkgver\_amd64.AppImage
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
	libsoup3
	openssl
	pango
	webkit2gtk-4.1
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
	fe924d7005a806daddda617519add79f85201c4c513d831d6d530cf6e913abb5
	c4660da2255accdcdee8346b065fc7e4e6b354c5e61d05f3c1c19ff62acd0c01
)

prepare() {
	./"$(echo $_appimage | sed "s/\./ /")" --appimage-extract

	cd squashfs-root/
	mv YARC\ Launcher.desktop $_binname.desktop

	# Add game category
	sed -i '2s/$/Game;/' $_binname.desktop
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
