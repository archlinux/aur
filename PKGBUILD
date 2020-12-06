# Maintainer: bnavigator <code at bnavigator dot de>
# Contributor: mwawrzyniak <arch at cmstactical dot net>
# Contributor: PlusMinus

_basepkgname=evdi
pkgname=evdi-1.7
pkgver=1.7.1
pkgrel=2
pkgdesc="A Linux® kernel module that enables management of multiple screens."
arch=('i686' 'x86_64')
url="https://github.com/DisplayLink/evdi"
license=('GPL')
groups=()
depends=(glibc dkms libdrm)
makedepends=()
optdepends=()
provides=("evdi=$pkgver")
conflicts=('evdi')
changelog=$pkgname.Changelog
source=($_basepkgname-$pkgver-$pkgrel.tar.gz::https://github.com/DisplayLink/evdi/archive/v$pkgver.tar.gz)
sha256sums=('0c0e4682703df08ed362f4ef65eedb20902d60c5f640c7447e315cafc0a6751d')

prepare() {
  cd "$_basepkgname-$pkgver"
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    patch -Np1 < "../$src"
  done
}

build() {
# We only need to build the library in this step, dkms will build the module
cd "$_basepkgname-$pkgver/library"

make
}

package() {
# Predfine some target folders
SRCDIR="$pkgdir/usr/src/$_basepkgname-$pkgver"	# This one is needed for dkms
LIBNAME=lib$_basepkgname

cd "$_basepkgname-$pkgver"

install -D -m 755 library/$LIBNAME.so $pkgdir/usr/lib/$LIBNAME.so

install -d $SRCDIR
install -D -m 755 module/* $SRCDIR
}
