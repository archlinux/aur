# Maintainer: Rihards Skuja <rihards at skuja dot eu>

pkgname=openhd-git
_reponame=OpenHD
pkgver=2.5.3.r23.gb9ed014
pkgrel=1
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
source=("git+https://github.com/OpenHD/$_reponame.git" "0001-fix-compile-on-gcc-13.patch" "0002-fix-compile-on-gcc-13.patch")
sha256sums=('SKIP'
            '7637ec59e85b4616d05d1f0c81a10fca921473b4b124c04e6506213718bb205a'
            '118befc82ae46153b407ea66fdf7ee4bc0043cb0d36308e124703da1d01f8a79')

pkgver() {
	cd "$_reponame"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_reponame"
	git submodule update --init --recursive
	patch -d 'OpenHD/ohd_interface/lib/wifibroadcast' -p1 -i "$srcdir/0001-fix-compile-on-gcc-13.patch"
	patch -p1 -i "$srcdir/0002-fix-compile-on-gcc-13.patch"
}

build() {
	cmake -B build -S "$_reponame/OpenHD" -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
