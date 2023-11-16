# Maintainer: GANPI <some.kind@of.mail>
pkgname=yarc-launcher
pkgver=0.2.5
pkgrel=1
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
	openssl
	pango
	webkit2gtk
)
makedepends=(cargo nodejs npm)
optdepends=(
	"hidapi: support for HID devices in-game"
	"systemd-libs: udev services in-game"
)
conflicts=($pkgname-bin)
source=(
	$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz
	$pkgname.desktop
)
sha256sums=(
	f290c95be6177ee6cecf7ec480b22325cb4c1c91af605b8b4e406d165f47cfbd
	d6cff5551389bbd5744179f169336c165ce1e9de65b34897c4ab5d40527a780e
)

prepare() {
	cd YARC-Launcher-$pkgver/

	# Change icon name
	mv src-tauri/icons/128x128@2x.png src-tauri/icons/256x256@2.png

	# Disable bundle
	sed -i '44s/true/false/' src-tauri/tauri.conf.json
}

build() {
	cd YARC-Launcher-$pkgver/

	npm install
	npm run build
}

package() {
	cd YARC-Launcher-$pkgver/

	# 69-hid.rules
	install -dm755 $pkgdir/etc/udev/rules.d/

	echo 'KERNEL=="hidraw*", TAG+="uaccess"' > $pkgdir/etc/udev/rules.d/69-hid.rules

	# binary
	install -Dm755 src-tauri/target/release/$pkgname -t $pkgdir/usr/bin/

	# .desktop
	install -Dm644 $srcdir/$pkgname.desktop -t $pkgdir/usr/share/applications/

	# icons
	for _size in 32x32 128x128 256x256@2; do
		_iconpath=usr/share/icons/hicolor/$_size/apps

		install -Dm644 src-tauri/icons/$_size.png $pkgdir/$_iconpath/$pkgname.png
	done

	# LICENSE
	install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
}