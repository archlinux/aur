# Maintainer: Kristopher James Kent <aur@kjkent.dev>
pkgname='imsprog'
_pkgname='IMSProg'
depends=('libusb>=1.0.20' 'qt5-base' 'wget' 'zenity') 
makedepends=('cmake>=3.10.0')
url="https://github.com/bigbigmdm/$pkgname"
pkgver='1.3.8'
pkgrel='1'
arch=('x86_64')
license=('GPL-3.0-only')
pkgdesc='I2C, SPI and MicroWire EEPROM/flash chip programmer for CH341a devices.'
b2sums=('e53d31b8b805a9e281bd810e4d6ac03ea0ffba36b5121c48284198196322316c9552b27579aa5cedcc09feada2ee3281d671e74940d3228507db76e81332984c')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")

_srcprefix="$_pkgname-$pkgver/$_pkgname"
_srcdirs=("${_srcprefix}_editor" "${_srcprefix}_programmer")

build() {
	for _srcdir in "${_srcdirs[@]}"; do
		local _bindir="$_srcdir/build"
		mkdir "$_bindir"
		cmake -S "$_srcdir"                   \
		      -B "$_bindir"                   \
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
