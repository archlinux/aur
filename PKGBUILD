# Maintainer: Kristopher James Kent <aur@kjkent.dev>
pkgname='imsprog'
_pkgname='IMSProg'
depends=('libusb>=1.0.20' 'qt5-base' 'wget' 'zenity') 
makedepends=('cmake>=3.10.0', 'qt5-tools')
url="https://github.com/bigbigmdm/$pkgname"
pkgver='1.3.9'
pkgrel='2'
arch=('x86_64')
license=('GPL-3.0-only')
pkgdesc='I2C, SPI and MicroWire EEPROM/flash chip programmer for CH341a devices.'
b2sums=('ccb5566adb467908e7c51b00a5c19943e6f6bdebde2615c9579e7e1160213ee2cc48266533c5a314c2287e43479429b6112e78aec48c4e5cdfa9f9f621b6777e')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")

_srcprefix="$_pkgname-$pkgver/$_pkgname"
_srcdirs=("${_srcprefix}_editor" "${_srcprefix}_programmer")

build() {
	for _srcdir in "${_srcdirs[@]}"; do
		local _bindir="$_srcdir/build"
		mkdir "$_bindir"
		cmake -S "$_srcdir" \
		      -B "$_bindir" \
		      -DCMAKE_INSTALL_PREFIX=/usr
		make  -C "$_bindir" -j`nproc`
	done
}

package() {
	for _bindir in "${_srcdirs[@]}"; do
		make DESTDIR="$pkgdir"   \
		     -C "$_bindir/build" \
		     install
	done
}
