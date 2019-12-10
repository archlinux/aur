# Maintainer: mwawrzyniak
# Contributor: PlusMinus
# Contributor: Squalou (for this no-5.4-patch build only)

pkgname=evdi-4.19
pkgsrcname=evdi
pkgver=1.6.4
pkgrel=2
pkgdesc="A Linux® kernel (4.19-LTS, <5.4) module that enables management of multiple screens."
arch=('i686' 'x86_64')
url="https://github.com/DisplayLink/evdi"
license=('GPL')
groups=()
depends=(dkms libdrm linux-lts linux-lts-headers)
makedepends=()
optdepends=()
provides=(evdi)
conflicts=(evdi)
replaces=()
backup=()
options=()
install=$pkgname.install
changelog=$pkgname.Changelog
source=($pkgsrcname-$pkgver-$pkgrel.tar.gz::https://github.com/DisplayLink/evdi/archive/v$pkgver.tar.gz
        relro.patch)
noextract=()
md5sums=('67d8ab1bb7a4ca013c5435df42ace5dc'
         '05e64dd295a66c030139d0c8f6f7013b')

prepare() {
  cd "$pkgsrcname-$pkgver"
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
cd "$pkgsrcname-$pkgver/library"

make
}

package() {
# Predfine some target folders
SRCDIR="$pkgdir/usr/src/$pkgsrcname-$pkgver"	# This one is needed for dkms
LIBNAME=lib$pkgsrcname

cd "$pkgsrcname-$pkgver"

install -D -m 755 library/$LIBNAME.so $pkgdir/usr/lib/$LIBNAME.so

install -d $SRCDIR
install -D -m 755 module/* $SRCDIR
}
