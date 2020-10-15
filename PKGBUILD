# Maintainer: bnavigator <code at bnavigator dot de>
# Contributor: mwawrzyniak <arch at cmstactical dot net>
# Contributor: PlusMinus

_basepkgname=evdi
pkgname=evdi-1.7
pkgver=1.7.0
pkgrel=1
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
install=$pkgname.install
changelog=$pkgname.Changelog
source=($_basepkgname-$pkgver-$pkgrel.tar.gz::https://github.com/DisplayLink/evdi/archive/v$pkgver.tar.gz
        $pkgname-pr228-kernel59.patch::https://github.com/DisplayLink/evdi/pull/228.patch)
sha256sums=('4b315c8cba623bad2be83b9ae07cb369d9c649afed9af13af572c60c431170d0'
            '97359775cb73a595536224a4f23bb9cbc5101f2c73a37477424b01e71e1a827d')

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
