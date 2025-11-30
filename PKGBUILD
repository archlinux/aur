# Maintainer: Kristopher James Kent <kris@kjkent.dev>
pkgname='imsprog'
_pkgname='IMSProg'
depends=('libusb>=1.0.20' 'qt5-base' 'wget' 'zenity')
makedepends=('cmake>=3.10.0', 'qt5-tools')
url="https://github.com/bigbigmdm/$pkgname"
pkgver='1.7.2'
pkgrel='1'
arch=('x86_64')
license=('GPL-3.0-only')
pkgdesc='I2C, SPI and MicroWire EEPROM/flash chip programmer for CH341a devices.'
b2sums=('60fe57569a594ff9dbb9f7e2d2c5c113849a762708c861ba4415d77a7d6c5c33b72904768870948e843004f5d0671814c286c980d5f5aa2d856c9236eaece788')
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
