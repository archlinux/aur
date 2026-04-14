# Maintainer: GANPI <some.kind@of.mail>
pkgname=yarc-launcher
pkgver=1.3.0
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
	webkit2gtk-4.1
)
makedepends=(cargo nodejs npm)
optdepends=(
	'hidapi: support for HID devices (in-game)'
	'pulseaudio-alsa: audio support (in-game)'
	'systemd-libs: access to HID devices (in-game)'
)
conflicts=($pkgname-bin)
options=(!debug !lto)
source=(
	$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz
	$pkgname.desktop
)
sha256sums=(
	2a5e2111e12e28337369e3e2e0462bb5924aa3bbbbc7de1382270d10507f1cf5
	9f1af65bb63ff67296aa41583d542850af1e146f9ede71818cb6a4bf3befb6c4
)

prepare() {
	cd YARC-Launcher-$pkgver/

	# Disable bundle
	sed -i '9s/true/false/' src-tauri/tauri.conf.json5
}

build() {
	cd YARC-Launcher-$pkgver/

	npm install
	npm run build
}

package() {
	cd YARC-Launcher-$pkgver/

	# udev rules (in-game)
	install -dm755 $pkgdir/etc/udev/rules.d/
	# - access to HID devices
	echo 'KERNEL=="hidraw*", TAG+="uaccess"' > $pkgdir/etc/udev/rules.d/69-hid.rules
	# - improved compatibility of the XBOX 360 Wireless Adapter
	printf "%s\n" \
	'SUBSYSTEM=="usb", ATTR{idVendor}=="045e", ATTR{idProduct}=="0291", MODE="0666"' \
	'SUBSYSTEM=="usb", ATTR{idVendor}=="045e", ATTR{idProduct}=="02a9", MODE="0666"' \
	'SUBSYSTEM=="usb", ATTR{idVendor}=="045e", ATTR{idProduct}=="0719", MODE="0666"' \
	> $pkgdir/etc/udev/rules.d/99-yarg-libusb.rules

	# binary
	install -Dm755 src-tauri/target/release/YARC\ Launcher $pkgdir/usr/bin/$pkgname

	# desktop file
	install -Dm644 $srcdir/$pkgname.desktop -t $pkgdir/usr/share/applications/

	# icons
	for _size in 32x32 128x128 128x128@2x; do
		_iconpath=usr/share/icons/hicolor/$_size/apps/

		install -Dm644 src-tauri/icons/$_size.png $pkgdir/$_iconpath/$pkgname.png
	done

	# LICENSE
	install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
}
