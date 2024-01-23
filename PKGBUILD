# Maintainer: Kristopher James Kent <aur@kjkent.dev>
pkgname='imsprog'
_pkgname='IMSProg'
depends=('libusb>=1.0.20' 'qt5-base' 'wget' 'zenity') 
makedepends=('cmake>=3.10.0')
url="https://github.com/bigbigmdm/$pkgname"
pkgver='1.1.4'
pkgrel='2'
arch=('x86_64')
license=('GPL3')
provides=("$pkgname")
pkgdesc='I2C, SPI and MicroWire EEPROM/flash chip programmer for CH341a devices.'
b2sums=('07e441bd8d933755471bc3dd30b3c5f2e3811fe347f7dea40ab20fcef9c92a56fafb65487ee3983285cee479d3bf23998166935806403df57686ff443ed72dc7')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/refs/tags/v$pkgver-$pkgrel.tar.gz")

_srcprefix="$_pkgname-$pkgver-$pkgrel/${_pkgname}"
_srcdirs=("${_srcprefix}_editor" "${_srcprefix}_programmer")

build() {
	for _srcdir in "${_srcdirs[@]}"; do
		local _bindir="$_srcdir/build"
		mkdir "$_bindir"
		cmake -S "$_srcdir"                   \
		      -B "$_bindir"                   \
		      -DCMAKE_INSTALL_PREFIX=/usr     \
		      -DCMAKE_INSTALL_SYSCONFDIR=/etc
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
