# lib32 Maintainer: Dan Ziemba <zman0900@gmail.com>
# Maintainer: Alexandru Ianu <alexandru.ianu@gmail.com>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Christoph Vigano <mail@cvigano.de>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: bender02 at gmx dot com

_pkgbasename=nettle
pkgname=${_pkgbasename}4
pkgver=2.7.1
pkgrel=4
pkgdesc="A low-level cryptographic library (legacy version)"
arch=('x86_64' 'i686')
url="http://www.lysator.liu.se/~nisse/nettle/"
license=('GPL2')
depends=('gmp' $_pkgbasename)
makedepends=(gcc)
source=(ftp://ftp.gnu.org/gnu/nettle/$_pkgbasename-$pkgver.tar.gz{,.sig})
md5sums=('003d5147911317931dd453520eb234a5'
         'SKIP')
validpgpkeys=(343C2FF0FBEE5EC2EDBEF399F3599FF828C67298)

build() {
  cd "$srcdir/$_pkgbasename-$pkgver"

  export CC="gcc"
  export CXX="g++"
  export PKG_CONFIG_PATH="/usr/lib/pkgconfig"

  ./configure --prefix=/usr --libdir=/usr/lib \
    --enable-shared --with-include-path=/usr/lib/gmp
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
  rm -f ${pkgdir}/usr/lib/{libhogweed,libnettle}.a

  install -m 0755 -d "${pkgdir}"/usr/lib/nettle4 
  mv "${pkgdir}"/usr/{include,lib/nettle4}
  rm -rf "${pkgdir}"/usr/{share,bin,lib/{*.so,pkgconfig}}
}
