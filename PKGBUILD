# Original Extra Repo
# ===================
# Maintainer: Allan McRae <allan@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

# Modifications to Use Git Master Source
# ======================================
# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>
#    * This PKGFILE as closely as possible matches extra's binutils 8.2-2
#    * Installs some things to /usr/$CHOST/... {/usr/x86_64-unknown-linux-gnu/...) rather than /usr/...
#       * Investigating to determine if this is desired, or if they need to be moved

pkgbase=gdb-trunk
# gdb-common-trunk is a package that contains files common for all cross compiled versions
# of gdb (for arm/avr/...)
pkgname=(gdb-trunk gdb-common-trunk)
_pkgname=binutils-gdb
pkgver=8.2.r95795.4de5434b69
pkgrel=1
pkgdesc='The GNU Debugger'
arch=(x86_64)
url='http://www.gnu.org/software/gdb/'
license=(GPL3)
makedepends=(texinfo python guile2.0 ncurses expat xz git)
source=(git+https://sourceware.org/git/binutils-gdb.git)
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
    --with-guile=guile-2.0 \
    --with-system-gdbinit=/etc/gdb/gdbinit
  make
}

package_gdb-common-trunk() {
  depends=(python guile2.0)
  provides=(gdb-common)
  conflicts=(gdb-common)

  cd $_pkgname
  make -C gdb/data-directory DESTDIR=$pkgdir install
}

package_gdb-trunk() {
  depends=(ncurses expat xz mpfr gdb-common-trunk=$pkgver)
  backup=(etc/gdb/gdbinit)
  provides=(gdb)
  conflicts=(gdb)

  cd $_pkgname
  make -C gdb DESTDIR=$pkgdir install

  # install "custom" system gdbinit
  install -dm755 $pkgdir/etc/gdb
  touch $pkgdir/etc/gdb/gdbinit

  # comes from gdb-common
  rm -r $pkgdir/usr/share/gdb/
}
