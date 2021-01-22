# Maintainer: Frank Seifferth <frankseifferth@posteo.net>
# Contributor: Tetsumi <tetsumi@vmail.me>
# Contributor: Bart Verhoeven <bartverhoeven@live.com>

pkgname=mercury
pkgver=20.06.1
pkgrel=1
pkgdesc="The mercury language compiler."
arch=('i686' 'x86_64')
url="http://www.mercurylang.org/"
license=('GPL')
depends=('gcc' 'make')
makedepends=('flex' 'bison')
source=(http://dl.mercurylang.org/release/mercury-srcdist-${pkgver}.tar.gz)
sha256sums=('ef093ae81424c4f3fe696eff9aefb5fb66899e11bb17ae0326adfb70d09c1c1f')

build() {
  cd "$srcdir"/mercury-srcdist-$pkgver

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
