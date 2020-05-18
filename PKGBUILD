# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>
# Contributor: Simon Reiser <me@sfxr.de>
# Contributor: Alexandru Ianu <alexandru.ianu@gmail.com>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Christoph Vigano <mail@cvigano.de>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: bender02 at gmx dot com

pkgname=nettle7
_pkgname=nettle
pkgver=3.5.1
pkgrel=1
pkgdesc="A low-level cryptographic library (legacy version)"
arch=('x86_64')
url="https://www.lysator.liu.se/~nisse/nettle"
license=('GPL2')
depends=('gmp')
checkdepends=('valgrind')
source=(https://ftp.gnu.org/gnu/$_pkgname/$_pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('75cca1998761b02e16f2db56da52992aef622bf55a3b45ec538bc2eedadc9419'
            'SKIP')
validpgpkeys=('343C2FF0FBEE5EC2EDBEF399F3599FF828C67298') # Niels Möller <nisse@lysator.liu.se>

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  export CC="gcc"
  export CXX="g++"
  export PKG_CONFIG_PATH="/usr/lib/pkgconfig"

  ./configure --prefix=/usr --libdir=/usr/lib \
    --enable-shared --with-include-path=/usr/lib/gmp
  make
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  install -m 0755 -d "${pkgdir}"/usr/lib/nettle7
  mv "${pkgdir}"/usr/{include,lib/nettle7}
  rm -rf "${pkgdir}"/usr/{share,bin,lib/{*.so,*.a,pkgconfig}}
}
