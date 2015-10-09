# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributor: Sudowoodo <sudowoodoarch@gmail.com>
# Contributor: Xemertix <arch88(at)katamail(dot)com>

pkgname=lib32-gmp4
pkgver=4.3.2
pkgrel=1
pkgdesc="Legacy version of gmp. Provides libgmp.so.3 (32 bit)"
arch=('x86_64')
url="http://gmplib.org/"
depends=('lib32-gcc-libs' 'sh' 'lib32-gmp')
makedepends=('gcc-multilib')
license=('LGPL3')
options=('!libtool')
source=(https://gmplib.org/download/gmp/gmp-${pkgver}.tar.bz2)
sha256sums=('936162c0312886c21581002b79932829aa048cfaf9937c6265aeaa14f1cd1775')
sha512sums=('2e0b0fd23e6f10742a5517981e5171c6e88b0a93c83da701b296f5c0861d72c19782daab589a7eac3f9032152a0fc7eff7f5362db8fccc4859564a9aa82329cf')

prepare(){
  cd gmp-${pkgver}
  #Put gmp.h in the same folder as gmpxx.h
  sed -i 's/$(exec_prefix)\/include/$\(includedir\)/' Makefile.in
}

build() {
  export ABI='32'
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd gmp-${pkgver}
  ./configure --prefix=/usr --libdir=/usr/lib32 \
              --includedir=/usr/lib32/gmp --enable-cxx
  make
}

package() {
  cd gmp-${pkgver}

  make DESTDIR="${pkgdir}" install
  #remove files that conflict with 'gmp' and 'lib32-gmp'
  rm -rf "${pkgdir}"/usr/share
  rm -rf "${pkgdir}"/usr/lib32/gmp
  rm -rf "${pkgdir}"/usr/lib32/libgmp.{a,so{,.10}}
  rm -rf "${pkgdir}"/usr/lib32/libgmpxx.{a,so{,.4}}

}
