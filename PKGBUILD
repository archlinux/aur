# Maintainer: Kristopher James Kent <kris@kjkent.dev>
pkgname='imsprog'
_pkgname='IMSProg'
depends=('libusb>=1.0.20' 'qt5-base' 'wget' 'zenity')
makedepends=('cmake>=3.10.0', 'qt5-tools')
url="https://github.com/bigbigmdm/$pkgname"
pkgver='1.7.1'
pkgrel='1'
arch=('x86_64')
license=('GPL-3.0-only')
pkgdesc='I2C, SPI and MicroWire EEPROM/flash chip programmer for CH341a devices.'
b2sums=('6237bc5040e184f1310b7fe79c4db194e2cf136c41749ed301226a1be8b04c48653c9166eb99019bee515e146d476e8eef9067859d16bea6ad1c873cdb8e5a16')
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
