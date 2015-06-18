# $Id: PKGBUILD 239354 2015-05-14 16:11:09Z anatolik $
# Maintainer: Allan McRae <allan@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gdb78
pkgver=7.8.2
pkgrel=1
pkgdesc='The GNU Debugger'
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gdb/"
license=('GPL3')
depends=('python2' 'xz' 'guile')
backup=('etc/gdb78/gdbinit')
source=(http://ftp.gnu.org/gnu/gdb/gdb-${pkgver}.tar.xz{,.sig})
sha1sums=('85a9cc2a4dfb748bc8eb74113af278524126a9bd'
          'SKIP')
validpgpkeys=('F40ADB902B24264AA42E50BF92EDB04BFF325CF3') # Joel Brobecker

prepare() {
  cd "gdb-${pkgver}"

  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  cd "gdb-${pkgver}"
  
  # guile support has a severe bug https://sourceware.org/bugzilla/show_bug.cgi?id=17247
  ./configure --prefix=/usr --disable-nls \
    --with-system-readline \
    --with-python=/usr/bin/python2 \
    --with-system-gdbinit=/etc/gdb78/gdbinit \
    --datadir=/usr/share/gdb78 \
    --program-suffix=-7.8

  make
}

package() {
  cd "gdb-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # install "custom" system gdbinit
  install -dm755 "${pkgdir}/etc/gdb78"
  touch "${pkgdir}/etc/gdb78/gdbinit"
  
  # resolve conflicts with system gdb
  rm -r "${pkgdir}/usr/bin/gdbserver-7.8"
  rm -r "${pkgdir}/usr/include/"
  rm -r "${pkgdir}/usr/lib/"
  rm -r "${pkgdir}/usr/share/info/"
  rm -r "${pkgdir}/usr/share/man"
}
