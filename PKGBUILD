# Maintainer:  Tyler Veness <calcmogul at gmail dot com>
# Contributor: Alex Brinister <alex_brinister@yahoo.com>

_target=powerpc-wrs-vxworks
pkgname=${_target}-gdb
pkgver=7.12.1
pkgrel=3
pkgdesc="The GNU Debugger (${_target})"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gdb/"
license=('GPL3')
depends=(wrs-vxworks-headers ncurses expat xz gdb-common)
makedepends=(texinfo python guile2.0 xz)
conflicts=('gdb-powerpc-wrs-vxworks')
provides=('gdb-powerpc-wrs-vxworks')
options=('!strip' 'libtool' '!zipman' 'staticlibs')
source=(http://ftp.gnu.org/gnu/gdb/gdb-"${pkgver}".tar.xz)
sha512sums=('0ac8d0a495103611ef41167a08313a010dce6ca4c6d827cbe8558a0c1a1a8a6bfa53f1b7704251289cababbfaaf9e075550cdf741a54d6cd9ca3433d910efcd8')

build() {
  cd "${srcdir}/gdb-${pkgver}"

  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

  ./configure \
    --prefix=/usr \
    --target=${_target} \
    --disable-nls \
    --with-python=/usr/bin/python3 \
    --with-guile=guile-2.0 \
    --with-sysroot=/usr/${_target} \
    --enable-lto
  make
}

package() {
  cd "${srcdir}/gdb-${pkgver}"

  make DESTDIR=${pkgdir} install

  # fix conflicts with gdb
  rm -r $pkgdir/usr/include/gdb
  rm -r $pkgdir/usr/share/info

  # comes from gdb-common
  rm -r $pkgdir/usr/share/gdb
}
