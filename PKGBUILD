# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=('gdb-git' 'gdb-common-git')
pkgver=112405.2e55fbce03a
pkgrel=1
pkgdesc="The GNU Debugger from git"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gdb/"
license=('GPL3')
makedepends=('git' 'source-highlight')
provides=('gdb-common' 'gdb')
conflicts=('gdb-common' 'gdb')
backup=('etc/gdb/gdbinit')
options=('!libtool')
source=('gdb::git+https://sourceware.org/git/binutils-gdb.git#branch=gdb-12-branch')
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
  CFLAGS+=" -fcommon" CXXFLAGS+=" -fpermissive" ../configure \
    --prefix=/usr \
    --disable-nls \
    --disable-gprofng \
    --enable-source-highlight \
    --enable-tui \
    --with-system-readline \
    --with-python=/usr/bin/python \
    --with-guile=guile-3.0 \
    --with-system-gdbinit=/etc/gdb/gdbinit
  make
}

package_gdb-git() {
  depends=('expat' 'guile' 'ncurses' 'xz' 'python' 'source-highlight' 'mpfr' 'xxhash' 'libelf' 'gdb-common-git')
  provides=('gdb')
  conflicts=('gdb')
  backup=(etc/gdb/gdbinit)
  cd "$srcdir/gdb/build"
  
  # install only gdb, otherwise it would install files already provided by binutils
  make DESTDIR="$pkgdir/" install-gdb

  # install "custom" system gdbinit
  install -dm755 $pkgdir/etc/gdb
  touch $pkgdir/etc/gdb/gdbinit
  
  # comes from gdb-common
  rm -r "$pkgdir/usr/share/gdb/"
}

package_gdb-common-git() {
  provides=('gdb-common')
  conflicts=('gdb-common')
  depends=('python-pygments' 'guile')
  cd "$srcdir/gdb/build"
  make -C gdb/data-directory DESTDIR="$pkgdir" install
}
