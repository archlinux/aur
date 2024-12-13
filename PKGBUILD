# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Frank Seifferth <frankseifferth@posteo.net>
# Contributor: Tetsumi <tetsumi@vmail.me>
# Contributor: Bart Verhoeven <bartverhoeven@live.com>

pkgname=mercury
pkgver=22.01.8
pkgrel=2
pkgdesc="The mercury language compiler."
arch=('i686' 'x86_64')
url="http://www.mercurylang.org/"
license=('GPL')
depends=('gcc' 'make')
makedepends=('flex' 'bison')
options=(staticlibs)
source=(http://dl.mercurylang.org/release/mercury-srcdist-${pkgver}.tar.xz)
b2sums=('18ded08484e9144edbc64ce7e31ce18b93b76889842cd968ae98eaba0c818655e04ac1a5b86c3147b0a8f09a6fbbcc39a244a48e27b88a1a5b9b5c3d56c8f251')

build() {
  cd "$srcdir"/mercury-srcdist-$pkgver

  echo "EXTRA_CFLAGS += -Wno-error=array-parameter" >> Mmake.params

  ./configure --prefix=/usr --mandir=/usr/share/man \
              --infodir=/usr/share/info \
              --disable-inefficient-grades

  make PARALLEL="$MAKEFLAGS"
}

package() {
  cd "$srcdir"/mercury-srcdist-$pkgver

  make DESTDIR="$pkgdir" \
       INSTALL_PREFIX="$pkgdir"/usr \
       INSTALL_MAN_DIR="$pkgdir"/usr/share/man \
       INSTALL_INFO_DIR="$pkgdir"/usr/share/info \
       MERCURY_COMPILER="$pkgdir"/usr/bin/mercury_compile \
       MERCURY_CONFIG_DIR="$pkgdir"/usr/lib/mercury \
       PARALLEL="$MAKEFLAGS" LIBGRADES=asm_fast.gc install

  rm "${pkgdir}"/usr/bin/{mdb,mercury,mprof}.bat
}
