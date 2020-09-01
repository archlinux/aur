# Maintainer: Joey Dumont <joey.dumont@gmail.com>
_target=mips64-elf
pkgname=$_target-gdb
pkgver=9.2
pkgrel=1
pkgdesc="The GNU Debugger (${_target})"
arch=(i686 x86_64)
url='http://www.gnu.org/software/gdb/'
license=(GPL3)
depends=(xz mpfr gdb-common)
makedepends=(texinfo python guile2.0)
options=(!emptydirs)
source=(ftp://ftp.gnu.org/gnu/gdb/gdb-$pkgver.tar.xz)
sha256sums=('360cd7ae79b776988e89d8f9a01c985d0b1fa21c767a4295e5f88cb49175c555')

prepare() {
  cd "${srcdir}"/gdb-${pkgver}
  mkdir "${srcdir}"/build-gdb

  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  cd ${srcdir}/build-gdb

  "${srcdir}"/gdb-${pkgver}/configure --prefix=/usr \
              --target=${_target} \
              --disable-nls \
              --with-python=/usr/bin/python3 \
              --with-guile=guile-2.0 \
              --with-sysroot=/usr/${_target} \
              --enable-lto
  make
}

package() {
  cd build-gdb

  make DESTDIR="$pkgdir" install

  # fix conflicts with gdb
  rm -r $pkgdir/usr/include/gdb
  rm -r $pkgdir/usr/share/info

  # comes from gdb-
  rm -r $pkgdir/usr/share/gdb
}
