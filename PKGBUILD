# Maintainer: Kristopher James Kent <kris@kjkent.dev>
pkgname='imsprog'
_pkgname='IMSProg'
depends=('libusb>=1.0.20' 'qt5-base' 'wget' 'zenity')
makedepends=('cmake>=3.10.0', 'qt5-tools')
url="https://github.com/bigbigmdm/$pkgname"
pkgver='1.6.1'
pkgrel='1'
arch=('x86_64')
license=('GPL-3.0-only')
pkgdesc='I2C, SPI and MicroWire EEPROM/flash chip programmer for CH341a devices.'
b2sums=('1a758b006e0b710d078ce292d60e7949210ed61c56383de5e348fbe176349c56b30a52250d406a3a20422db77d5b23e70285a95769d79793176751b44340514b')
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
