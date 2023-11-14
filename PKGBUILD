# Maintainer: Rihards Skuja <rihards at skuja dot eu>

pkgname=openhd-git
_reponame=OpenHD
pkgver=2.5.0.beta3.r381.gf559237
pkgrel=2
pkgdesc='Open-source digital FPV system'
arch=(any)
url='https://openhdfpv.org'
license=(GPL3)
depends=(gst-plugins-good gst-plugins-bad gst-plugins-ugly gst-plugin-libcamera libpcap libsodium sdl2 sudo v4l-utils)
makedepends=(cmake git)
optdepends=(
	'rtl88x2bu-openhd-dkms-git: driver for RTL88x2BU Wi-Fi cards'
	'rtl8812au-openhd-dkms-git: driver for RTL88xxAU Wi-Fi cards'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/OpenHD/$_reponame.git" "0001-fix-compile-on-gcc-13.patch")
sha256sums=('SKIP'
            'f5353f5411a41833a050cee54d9b461261c8a68eb9051547830960d06c0c0733')

pkgver() {
	cd "$_reponame"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_reponame"
	git submodule update --init --recursive
	patch -d 'OpenHD/lib/wifibroadcast' -p1 -i "$srcdir/0001-fix-compile-on-gcc-13.patch"
}

build() {
	cmake -B build -S "$_reponame/OpenHD" -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
