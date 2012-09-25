# $Id: PKGBUILD 72474 2012-06-15 10:29:22Z dreisner $
# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

_pkgbasename=util-linux
pkgname=libx32-$_pkgbasename
pkgver=2.21.2
pkgrel=1.1
pkgdesc="Miscellaneous system utilities for Linux (x32 ABI)"
url='http://www.kernel.org/pub/linux/utils/util-linux/'
arch=('x86_64')
depends=('libx32-glibc' "$_pkgbasename")
makedepends=('gcc-multilib-x32')
provides=('libx32-util-linux-ng')
conflicts=('libx32-util-linux-ng')
replaces=('libx32-util-linux-ng')
license=('GPL2')
options=('!libtool' '!emptydirs')
source=("ftp://ftp.kernel.org/pub/linux/utils/util-linux/v2.21/util-linux-$pkgver.tar.xz")
md5sums=('54ba880f1d66782c2287ee2c898520e9')

shopt -s extglob

build() {
  cd "$_pkgbasename-$pkgver"

  export CC="gcc -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  #./autogen.sh
  ./configure --without-ncurses --libdir=/usr/libx32

  for lib in lib{mount,blkid,uuid}; do
    make -C "$lib"
  done
}

package() {
  make -C "$_pkgbasename-$pkgver" DESTDIR="$pkgdir" install

  # remove everything but libs
  rm -rf "$pkgdir"/!(usr) "$pkgdir"/usr/!(libx32)
}
