# $Id$
# Original Extra Repo
# ===================
# Maintainer: Allan McRae <allan@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

# Modifications to Use Git Master Source
# ======================================
# Maintainer: James Harvey <jamespharvey20@gmail.com>
#    * This PKGFILE as closely as possible matches extra's binutils 7.9.1-1
#    * Installs some things to /usr/$CHOST/... {/usr/x86_64-unknown-linux-gnu/...) rather than /usr/...
#       * Investigating to determine if this is desired, or if they need to be moved

pkgname=gdb-trunk
_pkgname=binutils-gdb
pkgver=r84247.4931af2
pkgrel=1
pkgdesc='The GNU Debugger'
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gdb/"
license=('GPL3')
depends=('ncurses' 'expat' 'python2' 'xz' 'guile')
makedepends=('texinfo' 'git')
provides=('gdb')
conflicts=('gdb')
backup=('etc/gdb/gdbinit')
install=gdb.install
source=('git://sourceware.org/git/binutils-gdb.git')
sha1sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd $_pkgname

  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  cd $_pkgname
  
  # guile support has a severe bug https://sourceware.org/bugzilla/show_bug.cgi?id=17247
  ./configure --prefix=/usr --disable-nls \
    --with-system-readline \
    --with-python=/usr/bin/python2 \
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
