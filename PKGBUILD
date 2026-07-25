# shellcheck disable=SC2034,SC2154,SC2164,SC2016
# Old Maintainer: Uncle Hunto <unclehunto at YaI00 D0t COM>
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>
# Contributor: Sudowoodo <sudowoodoarch@gmail.com>
# Contributor: Xemertix <arch88(at)katamail(dot)com>

pkgname=lib32-gmp4-v2
pkgver=4.3.2
pkgrel=3
pkgdesc="Legacy version of gmp. Provides libgmp.so.3 (32 bit)"
arch=('x86_64')
url="http://gmplib.org/"
depends=('lib32-gcc-libs' 'sh' 'lib32-gmp')
makedepends=('gcc-multilib')
license=('LGPL3')
options=('!libtool' '!lto')
source=(
  "https://gmplib.org/download/gmp/archive/gmp-${pkgver}.tar.bz2"
  'fix_get-d_and_t-scan.patch'
)
sha256sums=(
  '936162c0312886c21581002b79932829aa048cfaf9937c6265aeaa14f1cd1775'
  '88e95869f46106147726a6583222be57be15b0e2b05ef642403251ededeb9830'
)

prepare() {
  cd gmp-${pkgver}
  # Put gmp.h in the same folder as gmpxx.h
  sed -i 's/$(exec_prefix)\/include/$\(includedir\)/' Makefile.in
  # Another incovenients
  patch -Np1 -i "${srcdir}/fix_get-d_and_t-scan.patch"
}

build() {
  export ABI='32'
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  export CFLAGS="${CFLAGS} -std=gnu89"
  export CXXFLAGS="${CXXFLAGS} -std=gnu++98"

  cd gmp-${pkgver}
  ./configure --prefix=/usr --libdir=/usr/lib32 \
    --includedir=/usr/lib32/gmp --enable-cxx
  make
  make check
}

package() {
  cd gmp-${pkgver}

  make DESTDIR="${pkgdir}" install
  #remove files that conflict with 'gmp' and 'lib32-gmp'
  rm -rf "${pkgdir:?}/usr/share"
  rm -rf "${pkgdir:?}/usr/lib32/gmp"
  rm -rf "${pkgdir:?}/usr/lib32/libgmp".{a,so{,.10}}
  rm -rf "${pkgdir:?}/usr/lib32/libgmpxx".{a,so{,.4}}

}
