# Maintainer: gilbus <aur(AT)tinkershell.eu>
pkgname=swaylock
pkgver=1.2
pkgrel=2
license=("MIT")
pkgdesc="Screen locker for Wayland"
makedepends=("meson" "git" "scdoc" "wayland-protocols")
depends=(
	"wayland" "wlroots-git" "pango" "cairo" "pam"
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
sha256sums=('211c77a40ff464651522c751838b04b4703b02c191e388d83d147a960e45c0c1'
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
