# Maintainer: GANPI <some.kind@of.mail>
pkgname=yarc-launcher
pkgver=1.3.0
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
makedepends=(
	cargo
	git
	git-lfs
	nodejs
	npm
)
optdepends=(
	'hidapi: access to HID devices (in-game)'
	'pipewire-alsa: audio support (in-game)'
	'systemd-libs: HID device detection (in-game)'
)
conflicts=($pkgname-bin)
options=(!debug !lto)
source=(
	"$pkgname::git+$url.git#tag=v$pkgver"
	69-hid.rules
	99-yarg-libusb.rules
	$pkgname.desktop
)
sha256sums=(
	60720ac369cbd62e04f844590a224743da225de174d7b97be0deb00f9bd19898
	4aa703ca90992584b22ed553ae180e5cadf7223feb693b0cb367b32e56d27ed1
	21387a52411c408243b757bf1ffe17c1f377dfe9f2174415f807c175da0d5227
	9f1af65bb63ff67296aa41583d542850af1e146f9ede71818cb6a4bf3befb6c4
)

prepare() {
	cd $pkgname

	git lfs install --local
	git remote add network-origin "$url.git" 2> /dev/null || true
	git lfs pull network-origin

	# Disable bundle
	sed -i '9s/true/false/' src-tauri/tauri.conf.json5
}

build() {
	cd $pkgname

	npm install
	npm run build
}

package() {
	cd $pkgname

	# binary
	install -Dm755 src-tauri/target/release/YARC\ Launcher $pkgdir/usr/bin/$pkgname

	install -Dm644 "$srcdir/69-hid.rules" -t "$pkgdir/usr/lib/udev/rules.d"
	install -Dm644 "$srcdir/99-yarg-libusb.rules" -t "$pkgdir/usr/lib/udev/rules.d"

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
