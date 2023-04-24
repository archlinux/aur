# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Frank Seifferth <frankseifferth@posteo.net>
# Contributor: Tetsumi <tetsumi@vmail.me>
# Contributor: Bart Verhoeven <bartverhoeven@live.com>

pkgname=mercury
pkgver=22.01.5
pkgrel=1
pkgdesc="The mercury language compiler."
arch=('i686' 'x86_64')
url="http://www.mercurylang.org/"
license=('GPL')
depends=('gcc' 'make')
makedepends=('flex' 'bison')
source=(http://dl.mercurylang.org/release/mercury-srcdist-${pkgver}.tar.xz)
sha512sums=('0b64eb90b1ddac4199a6077bd7a41c95eae4b388170889ba6f6ddd528f2c0a1cb4206d0a1957537c2b34ce1aeaae476fd505b12c2a00ca9b85bed378541b3e47')

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
