# Maintainer: Orlando Arias <orlandoarias at gmail <dot> com>

_target=msp430-elf
pkgname="${_target}-gdb"
pkgver=12.1
pkgrel=1
pkgdesc="The GNU Debugger for the ${_target} target."
arch=('x86_64' 'x86')
url="https://www.gnu.org/software/gdb/download/"
license=('GPL')
groups=('devel')
depends=("python" "readline" "ncurses" "gdb-common" "guile" "expat" "xz" "gmp")
source=("http://ftp.gnu.org/gnu/gdb/gdb-${pkgver}.tar.xz")
sha256sums=('0e1793bf8f2b54d53f46dea84ccfd446f48f81b297b28c4f7fc017b818d69fed')


prepare() {
  cd "$srcdir/gdb-$pkgver"
  [[ -d gdb-build ]] && rm -rf gdb-build
  mkdir gdb-build
  
  # fix libiberty
  # sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

}

build() {
  unset LDFLAGS	
  export CFLAGS="-O2 -pipe"
  export CXXFLAGS="-O2 -pipe"
  export CPPFLAGS="-O2 -pipe"
  
  cd "$srcdir/gdb-$pkgver/gdb-build"

  # build gdb
  ../configure \
    --prefix=/usr \
    --target=${_target} \
    --host=${CHOST} \
    --build=${CHOST} \
    --with-sysroot=/usr/${_target} \
    --disable-nls \
    --with-python=/usr/bin/python \
    --enable-multilib \
    --with-system-readline \
    --disable-werror \
    --enable-tui \
    --with-guile

  make
}


package() {
  cd "$srcdir/gdb-$pkgver/gdb-build"
  make DESTDIR="$pkgdir" install
  
  # handle conflicts
  rm -r ${pkgdir}/usr/share/info
  rm -r ${pkgdir}/usr/share/man
  rm -r ${pkgdir}/usr/share/gdb/
  rm -r ${pkgdir}/usr/include/gdb
}

# vim:set ts=2 sw=2 et:
