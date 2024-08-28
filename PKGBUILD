# Maintainer: GANPI <some.kind@of.mail>
pkgname=yarc-launcher
pkgver=1.0.0
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
	openssl
	pango
	webkit2gtk
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
	236e7e6652b6fffe3f11376e6ee2581d3a2fd40ed33440b63db8da7ca63cad8e
	d6cff5551389bbd5744179f169336c165ce1e9de65b34897c4ab5d40527a780e
)

prepare() {
	cd YARC-Launcher-$pkgver/

	# Disable bundle
	sed -i '56s/true/false/' src-tauri/tauri.conf.json5
}

build() {
	cd YARC-Launcher-$pkgver/

	npm install
	npm run build
}

package() {
	cd YARC-Launcher-$pkgver/

	# udev rule (in-game)
	install -dm755 $pkgdir/etc/udev/rules.d/

	echo 'KERNEL=="hidraw*", TAG+="uaccess"' > $pkgdir/etc/udev/rules.d/69-hid.rules

	# binary
	install -Dm755 src-tauri/target/release/$pkgname -t $pkgdir/usr/bin/

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