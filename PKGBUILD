# Maintainer: Kristopher James Kent <kris@kjkent.dev>
pkgname='imsprog'
_pkgname='IMSProg'
depends=('libusb>=1.0.20' 'qt5-base' 'wget' 'zenity')
makedepends=('cmake>=3.10.0', 'qt5-tools')
url="https://github.com/bigbigmdm/$pkgname"
pkgver='1.5.3'
pkgrel='1'
arch=('x86_64')
license=('GPL-3.0-only')
pkgdesc='I2C, SPI and MicroWire EEPROM/flash chip programmer for CH341a devices.'
b2sums=('ad44cfd6d836e61a356d3d9044355c62bcce33d7bbb5438c284d4224ef9938319b4bcfd0145db1f495aa26738d5b79cf5e73f84af072421b51e31d7b98971f1b')
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
    make -C "$_bindir" -j$(nproc)
  done
}

package() {
  for _bindir in "${_srcdirs[@]}"; do
    make DESTDIR="$pkgdir" \
      -C "$_bindir/build" \
      install
  done
}
