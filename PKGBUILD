# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gdb-git
pkgver=109622.f190d13c78b
pkgrel=1
pkgdesc="The GNU Debugger from git"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gdb/"
license=('GPL3')
depends=('expat' 'guile' 'ncurses' 'xz' 'python' 'source-highlight' 'mpfr' 'xxhash' 'libelf')
makedepends=('git')
provides=('gdb')
conflicts=('gdb')
backup=('etc/gdb/gdbinit')
options=('!libtool')
source=('gdb::git+https://sourceware.org/git/binutils-gdb.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/gdb"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd "$srcdir/gdb"

  # fixes build, copied from the gdb PKGBUILD
  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  cd "$srcdir/gdb"
  
  [[ -d build ]] || mkdir -p build
  cd build
  CFLAGS+=" -fcommon" ../configure \
    --prefix=/usr \
    --disable-nls \
    --disable-gprofng \
    --enable-source-highlight \
    --enable-tui \
    --with-system-readline \
    --with-python=/usr/bin/python \
    --with-guile=guile-2.2 \
    --with-system-gdbinit=/etc/gdb/gdbinit
  make
}

package() {
  cd "$srcdir/gdb/build"

  # install only gdb, otherwise it would install files already provided by binutils
  make DESTDIR="$pkgdir/" install-gdb

  # install "custom" system gdbinit
  install -dm755 $pkgdir/etc/gdb
  touch $pkgdir/etc/gdb/gdbinit
}
