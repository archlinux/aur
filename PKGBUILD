# Maintainer: Sudowoodo <sudowoodoarch@gmail.com>
# Contributor: Xemertix <arch88(at)katamail(dot)com>

pkgname=lib32-gmp4
pkgver=5.1.3
pkgrel=1
pkgdesc="Legacy version of gmp. Provides libgmp.so.3 (32 bit)"
arch=('x86_64')
url="http://gmplib.org/"
depends=('lib32-gcc-libs' 'sh' 'lib32-gmp')
makedepends=('gcc-multilib')
license=('LGPL3')
options=('!libtool')
source=(ftp://ftp.gnu.org/gnu/gmp/gmp-${pkgver}.tar.bz2)
md5sums=('a082867cbca5e898371a97bb27b31fea')

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
