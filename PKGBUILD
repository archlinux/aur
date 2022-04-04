# Maintainer: mwawrzyniak <arch at cmstactical dot net>
# Contributor: PlusMinus

pkgname=evdi
pkgver=1.10.1
pkgrel=2
pkgdesc="A Linux® kernel module that enables management of multiple screens."
arch=('i686' 'x86_64')
url="https://github.com/DisplayLink/evdi"
license=('GPL')
depends=(glibc dkms libdrm)
changelog=$pkgname.Changelog
source=(https://github.com/DisplayLink/evdi/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('4c6fe26b91b5e6490b80e4c30de110d72daf19e1d162e14a2654eee3fec19087')

prepare() {
  cd "$pkgname-$pkgver"
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    patch -Np1 -i "../$src"
  done
}

build() {
  # We only need to build the library in this step, dkms will build the module
  cd "$pkgname-$pkgver/library"
  make
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 library/lib$pkgname.so "$pkgdir/usr/lib/lib$pkgname.so"

  SRCDIR="$pkgdir/usr/src/$pkgname-$pkgver"	# This one is needed for dkms
  install -d "$SRCDIR"
  install -Dm0755 module/* "$SRCDIR"
}
