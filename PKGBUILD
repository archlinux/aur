# Maintainer: Kristopher James Kent <aur@kjkent.dev>
pkgname='imsprog'
_pkgname='IMSProg'
depends=('libusb>=1.0.20' 'qt5-base' 'wget' 'zenity') 
makedepends=('cmake>=3.10.0')
url="https://github.com/bigbigmdm/$pkgname"
pkgver='1.3.5'
pkgrel='1'
arch=('x86_64')
license=('GPL-3.0-only')
provides=("$pkgname")
pkgdesc='I2C, SPI and MicroWire EEPROM/flash chip programmer for CH341a devices.'
b2sums=('06cdbb83bfe74c9aff9203115d2e849eaf48e3e0704ecf98ad42b2945b6e607136d2566bd6d0a14eb5299d7affb5f3a86fd0bd8ad27225ca1db851436924e5c9')
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
