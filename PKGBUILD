# Maintainer: Joey Dumont <joey.dumont@gmail.com>
_target=mips64-elf
pkgname=$_target-gdb
pkgver=12.1
pkgrel=1
pkgdesc="The GNU Debugger (${_target})"
arch=(i686 x86_64)
url='http://www.gnu.org/software/gdb/'
license=(GPL3)
depends=(mpfr gdb-common guile2.0 libelf)
makedepends=(texinfo python)
options=(!emptydirs)
source=("ftp://ftp.gnu.org/gnu/gdb/gdb-$pkgver.tar.xz")
sha256sums=('0e1793bf8f2b54d53f46dea84ccfd446f48f81b297b28c4f7fc017b818d69fed')

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
              --enable-lto \
	      --disable-sim
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
