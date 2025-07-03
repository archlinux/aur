# Maintainer: Kristopher James Kent <kris@kjkent.dev>
pkgname='imsprog'
_pkgname='IMSProg'
depends=('libusb>=1.0.20' 'qt5-base' 'wget' 'zenity')
makedepends=('cmake>=3.10.0', 'qt5-tools')
url="https://github.com/bigbigmdm/$pkgname"
pkgver='1.6.2'
pkgrel='1'
arch=('x86_64')
license=('GPL-3.0-only')
pkgdesc='I2C, SPI and MicroWire EEPROM/flash chip programmer for CH341a devices.'
b2sums=('897a0554dc1720c0aad4e58a7331e2f4516e50b817b6910572237e62c633833896909386c9da7d1f9d36c61f44b3caed235c88fc566a4c48ab8c113b78688dc6')
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
