# Maintainer: Kristopher James Kent <aur@kjkent.dev>
pkgname='imsprog'
_pkgname='IMSProg'
depends=('qt5-base' 'libusb>=1.0.20')
makedepends=('cmake>=3.10.0')
url="https://github.com/bigbigmdm/$pkgname"
pkgver='1.1.2'
pkgrel='1'
arch=('x86_64')
license=('GPL3')
provides=("$pkgname")
pkgdesc='I2C, SPI and MicroWire EEPROM/flash chip programmer for CH341a devices.'
b2sums=('da90a7b806e86cff521ecb95eca7b7cb7c2f584b5b6d77631edba9685051a85ba8005d9ed159226be29aaa8cddeb71c93e60d5bc6bce5d95b183fbf47b2954de')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/refs/tags/v$pkgver-$pkgrel.tar.gz")

_srcprefix="$_pkgname-$pkgver-$pkgrel/${_pkgname}"
_srcdirs=("${_srcprefix}_editor" "${_srcprefix}_programmer")

build() {
	for _srcdir in "${_srcdirs[@]}"; do
		local _bindir="$_srcdir/build"
		mkdir "$_bindir"
		cmake -S "$_srcdir" -B "$_bindir"
		make  -C "$_bindir" -j`nproc`
	done
}

package() {
	for _bindir in "${_srcdirs[@]}"; do
		make CMAKE_INSTALL_PREFIX="/usr" \
		     DESTDIR="$pkgdir"           \
		     -C "$_bindir/build"         \
		     install
	done
}
