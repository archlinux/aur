# Maintainer: Kristopher James Kent <aur@kjkent.dev>
pkgname='imsprog'
_pkgname='IMSProg'
depends=('libusb>=1.0.20' 'qt5-base' 'wget' 'zenity') 
makedepends=('cmake>=3.10.0')
url="https://github.com/bigbigmdm/$pkgname"
pkgver='1.1.10'
pkgrel='1'
arch=('x86_64')
license=('GPL-3.0-only')
provides=("$pkgname")
pkgdesc='I2C, SPI and MicroWire EEPROM/flash chip programmer for CH341a devices.'
b2sums=('f3a29c120f75bba87285795250c76cbf717dc9578ff2441527e35f77f12363a8df9223fb7d73d708297b9df748534806a70db81729037c05e889b0719ff96bd1')
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
