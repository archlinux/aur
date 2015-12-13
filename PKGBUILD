# $Id$
# Original Extra Repo
# ===================
# Maintainer: Allan McRae <allan@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

# Modifications to Use Git Master Source
# ======================================
# Maintainer: James Harvey <jamespharvey20@gmail.com>
#    * This PKGFILE as closely as possible matches extra's binutils 7.10.1-1
#    * Installs some things to /usr/$CHOST/... {/usr/x86_64-unknown-linux-gnu/...) rather than /usr/...
#       * Investigating to determine if this is desired, or if they need to be moved

pkgname=gdb-trunk
_pkgname=binutils-gdb
pkgver=7.10.1.r85899.39040bb
pkgrel=1
pkgdesc='The GNU Debugger'
arch=(i686 x86_64)
url='http://www.gnu.org/software/gdb/'
license=(GPL3)
depends=(ncurses expat python xz guile)
makedepends=(texinfo git)
provides=(gdb)
conflicts=(gdb)
backup=(etc/gdb/gdbinit)
install=gdb.install
source=(git://sourceware.org/git/binutils-gdb.git)
sha1sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  # There are locations in source with versions, but they don't seem to be updated as often as the ChangeLog.  i.e. In GDB 7.10.1, the *only* mention of that version is in ChangeLog.
  echo $(cat gdb/ChangeLog | grep GDB | grep -i released | head -n 1 | sed "s| released\.$||" | sed "s|.*GDB ||").r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd $_pkgname

  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  cd $_pkgname
  
  ./configure --prefix=/usr --disable-nls \
    --with-system-readline \
    --with-python=/usr/bin/python3 \
    --with-system-gdbinit=/etc/gdb/gdbinit \
    --disable-binutils
  make
}

package() {
  cd $_pkgname
  echo "pkgdir is $pkgdir"
  make DESTDIR=$pkgdir install

  # install "custom" system gdbinit
  install -dm755 $pkgdir/etc/gdb
  touch $pkgdir/etc/gdb/gdbinit
}
