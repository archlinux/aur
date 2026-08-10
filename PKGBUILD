# Maintainer: GANPI <some.kind@of.mail>
pkgname=yarc-launcher-bin
_binname=${pkgname%-bin}
pkgver=1.3.0
_appimage=YARC.Launcher\_$pkgver\_amd64.AppImage
pkgrel=2
pkgdesc='The official launcher for YARG (a.k.a. Yet Another Launcher or YAL)'
arch=(x86_64)
url=https://github.com/YARC-Official/YARC-Launcher
license=(LicenseRef-YARG-1.0)
depends=(
	cairo
	gdk-pixbuf2
	glib2
	gtk3
	hicolor-icon-theme
	libsoup3
	openssl
	webkit2gtk-4.1
)
optdepends=(
	'hidapi: access to HID devices (in-game)'
	'pipewire-alsa: audio support (in-game)'
	'systemd-libs: HID device detection (in-game)'
)
provides=($_binname)
conflicts=($_binname)
options=(!debug)
source=(
	"$url/releases/download/v$pkgver/$_appimage"
	69-hid.rules
	99-yarg-libusb.rules
	https://raw.githubusercontent.com/YARC-Official/YARC-Launcher/master/LICENSE
)
sha256sums=(
	40e6e72370ed81f899f4660139ba076ad99d131bcabdca76499a3dceebb5e556
	4aa703ca90992584b22ed553ae180e5cadf7223feb693b0cb367b32e56d27ed1
	21387a52411c408243b757bf1ffe17c1f377dfe9f2174415f807c175da0d5227
	c4660da2255accdcdee8346b065fc7e4e6b354c5e61d05f3c1c19ff62acd0c01
)

prepare() {
	chmod +x $_appimage && "./$_appimage" --appimage-extract

	cd squashfs-root/
	mv YARC\ Launcher.desktop $_binname.desktop

	# Add game category
	sed -i '2s/$/Game;/' $_binname.desktop
}

package() {
	cd squashfs-root/

	# binary
	install -Dm755 usr/bin/$_binname -t $pkgdir/usr/bin/

	install -Dm644 "$srcdir/69-hid.rules" -t "$pkgdir/usr/lib/udev/rules.d"
	install -Dm644 "$srcdir/99-yarg-libusb.rules" -t "$pkgdir/usr/lib/udev/rules.d"

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
