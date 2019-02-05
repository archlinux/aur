# Maintainer: gilbus <aur(AT)tinkershell.eu>
pkgname=swaylock
pkgver=1.3
pkgrel=2
license=("MIT")
pkgdesc="Screen locker for Wayland"
makedepends=("meson" "git" "scdoc" "wayland-protocols")
depends=(
	"wayland" "libxkbcommon" "pango" "cairo" "pam"
)
optdepends=(
	"gdk-pixbuf2: For background images other than PNG"
)
arch=("i686" "x86_64")
url="https://swaywm.org"
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/swaywm/swaylock/archive/${pkgver}.tar.gz"
	"https://github.com/swaywm/swaylock/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz.sig"
)
sha256sums=('3bf4143136e688af2f31d10c0be26d14e371f31bfceec1d98db88abfe0f7a94c'
            'SKIP')
validpgpkeys=("9DDA3B9FA5D58DD5392C78E652CB6609B22DA89A") # Drew DeVault

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	# Fix ticket FS#31544, sed line taken from gentoo
	sed -i -e 's:login:system-auth:' pam/swaylock.linux
	meson -Dwerror=false --prefix /usr "$srcdir/build"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	ninja -C "$srcdir/build"
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	DESTDIR="$pkgdir/" ninja -C "$srcdir/build" install
}
