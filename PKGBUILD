# Maintainer: Dan Ziemba <zman0900@gmail.com>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Christoph Vigano <mail@cvigano.de>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: bender02 at gmx dot com

_pkgbasename=nettle
pkgname=lib32-${_pkgbasename}4
pkgver=2.7.1
pkgrel=1
pkgdesc="A low-level cryptographic library (32-bit, legacy version)"
arch=('x86_64')
url="http://www.lysator.liu.se/~nisse/nettle/"
license=('GPL2')
depends=('lib32-gmp' $_pkgbasename)
makedepends=(gcc-multilib)
source=(ftp://ftp.gnu.org/gnu/nettle/$_pkgbasename-$pkgver.tar.gz)
md5sums=('003d5147911317931dd453520eb234a5')

build() {
  cd "$srcdir/$_pkgbasename-$pkgver"

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure --prefix=/usr --libdir=/usr/lib32 \
    --enable-shared --with-include-path=/usr/lib32/gmp
  make
}

check() {
  cd "$srcdir/$_pkgbasename-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$_pkgbasename-$pkgver"
  make DESTDIR="$pkgdir/" install

  find $pkgdir
  
  # remove static libs	#--disable-static - build would break (since nettle 2.6) - and had no effect before
  rm -f ${pkgdir}/usr/lib32/{libhogweed,libnettle}.a

  install -m 0755 -d "${pkgdir}"/usr/include/nettle4 
  mv "${pkgdir}"/usr/include/nettle{,4/}
  rm -rf "${pkgdir}"/usr/{share,bin,lib32/{*.so,pkgconfig}}
}
