# Maintainer: Maxime Poulin <maxpoulin64@gmail.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
pkgname=gdb-ibuclaw-git
pkgver=84323.57f0502
pkgrel=1
pkgdesc="The GNU Debugger modified for D language support"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gdb/"
license=('GPL3')
depends=('expat' 'ncurses' 'python2' 'xz')
makedepends=('git')
provides=('gdb')
conflicts=('gdb')
backup=('etc/gdb/gdbinit')
options=('!libtool')
install=gdb.install
source=('gdb::git+https://github.com/ibuclaw/gdb.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/gdb"
  echo $(git rev-list --count dlang).$(git rev-parse --short dlang)
}

prepare() {
  cd "$srcdir/gdb"

  # fixes build, copied from the gdb PKGBUILD
  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  cd "$srcdir/gdb"

  ./configure --prefix=/usr --disable-nls \
              --disable-werror \
              --with-system-readline \
              --with-python=/usr/bin/python2 \
              --with-system-gdbinit=/etc/gdb/gdbinit

  make
}

package() {
  cd "$srcdir/gdb"

  # install only gdb, otherwise it would install files already provided by binutils
  make DESTDIR="$pkgdir/" install-gdb

  # install "custom" system gdbinit
  install -dm755 $pkgdir/etc/gdb
  touch $pkgdir/etc/gdb/gdbinit
}
