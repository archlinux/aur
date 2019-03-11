# Maintainer: gilbus <aur(AT)tinkershell.eu>
pkgname=sway-with-tray
_pkgname=sway
pkgver=1.0
pkgrel=1
pkgdesc="Sway with (rudimentary) tray support"
arch=("x86_64")
url="https://swaywm.org/"
license=("MIT")
depends=(
	"cairo"
	"json-c"
	"pango"
	"pcre"
	"wlroots"
)
makedepends=("meson" "ninja" "scdoc" "wayland-protocols")
optdepends=(
	"dmenu: Default for launching applications."
	"ffmpeg: For recording screencasts."
	"gdk-pixbuf2: Required for swaybg."
	"i3status: To display system information with a bar."
	"rxvt-unicode: Default terminal emulator."
)
validpgpkeys=("9DDA3B9FA5D58DD5392C78E652CB6609B22DA89A") # Drew DeVault
install=$_pkgname.install
source=(
	"$_pkgname-$pkgver.tar.gz::https://github.com/swaywm/$_pkgname/archive/$pkgver.tar.gz"
	"https://github.com/swaywm/$_pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz.sig"
)
sha256sums=(
	"24dafd0f1e630e97a5dd47233841adf856b665e2321d6207acfe6b3002d1bc56"
	"SKIP"
)
provides=("sway")
conflicts=("sway")

build() {
	cd "$_pkgname-$pkgver"
	mkdir "build"
	cd "build"
	meson -Dwerror=false -Denable-tray=true --prefix /usr ".."
	ninja
}

package() {
	DESTDIR="$pkgdir" ninja -C "$_pkgname-$pkgver/build" install
	install -Dm644 "$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
