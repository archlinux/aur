# Maintainer: Joey Dumont <joey.dumont@gmail.com>
_target=mips64-elf
pkgname=$_target-gdb
pkgver=10.1
pkgrel=1
pkgdesc="The GNU Debugger (${_target})"
arch=(i686 x86_64)
url='http://www.gnu.org/software/gdb/'
license=(GPL3)
depends=(mpfr gdb-common guile2.0 libelf)
makedepends=(texinfo python)
options=(!emptydirs)
source=("ftp://ftp.gnu.org/gnu/gdb/gdb-$pkgver.tar.xz")
sha256sums=('f82f1eceeec14a3afa2de8d9b0d3c91d5a3820e23e0a01bbb70ef9f0276b62c0')

prepare() {
  cd "${srcdir}/gdb-${pkgver}"
  mkdir "${srcdir}/build-gdb"

  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  cd "${srcdir}/build-gdb"

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
  rm -r "$pkgdir/usr/include/gdb"
  rm -r "$pkgdir/usr/share/info"

  # comes from gdb-
  rm -r "$pkgdir/usr/share/gdb"
}
