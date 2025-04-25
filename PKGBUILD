# Maintainer: Joey Dumont <joey.dumont@gmail.com>
_target=mips64-elf
pkgname=$_target-gdb
pkgver=16.3
pkgrel=1
pkgdesc="The GNU Debugger (${_target})"
arch=(i686 x86_64)
url='http://www.gnu.org/software/gdb/'
license=(GPL3)
depends=(mpfr gdb-common guile libelf)
makedepends=(texinfo python)
options=(!emptydirs)
source=("ftp://ftp.gnu.org/gnu/gdb/gdb-$pkgver.tar.xz")
sha256sums=('bcfcd095528a987917acf9fff3f1672181694926cc18d609c99d0042c00224c5')

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
              --with-python=/usr/bin/python \
	      --enable-tui \
	      --with-system-readline \
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
