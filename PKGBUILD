# Maintainer: Kristopher James Kent <aur@kjkent.dev>
pkgname='imsprog'
_pkgname='IMSProg'
depends=('libusb>=1.0.20' 'qt5-base' 'wget' 'zenity') 
makedepends=('cmake>=3.10.0')
url="https://github.com/bigbigmdm/$pkgname"
pkgver='1.3.2'
pkgrel='1'
arch=('x86_64')
license=('GPL-3.0-only')
provides=("$pkgname")
pkgdesc='I2C, SPI and MicroWire EEPROM/flash chip programmer for CH341a devices.'
b2sums=('8048a89f652b5e4705d58c7ff732e458a8e81e8c5b961a90c592706d3eed897b467a8839dff4554782855aa7c36275695fb5495f68a06bd2e11d7a233fcb75e5')
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
