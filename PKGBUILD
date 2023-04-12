# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=('gdb-git' 'gdb-common-git')
pkgver=14.0.50.r114329.8cb6bcc3eed
pkgrel=1
epoch=1
pkgdesc="The GNU Debugger from git"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gdb/"
license=('GPL3')
makedepends=('git' 'source-highlight')
provides=('gdb-common' 'gdb')
conflicts=('gdb-common' 'gdb')
options=('!libtool')
source=('gdb::git+https://sourceware.org/git/binutils-gdb.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/gdb"

  _ver="$(cat gdb/version.in | cut -dD -f1)"
  _rev="$(git rev-list --count HEAD)"
  _hash="$(git rev-parse --short HEAD)"
  printf '%s' "${_ver}r${_rev}.${_hash}"
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
  depends=('expat' 'guile' 'ncurses' 'xz' 'python' 'source-highlight'
	   'mpfr' 'xxhash' 'libelf' 'gdb-common-git')
  provides=('gdb')
  conflicts=('gdb')
  backup=(etc/gdb/gdbinit)
  cd "$srcdir/gdb/build"
  
  # install only gdb, otherwise it would install files already provided by binutils
  make DESTDIR="$pkgdir/" install-gdb

  # install "custom" system gdbinit
  install -dm755 "$pkgdir"/etc/gdb
  touch "$pkgdir"/etc/gdb/gdbinit
}

package_gdb-common-git() {
  provides=('gdb-common')
  conflicts=('gdb-common')
  depends=('python-pygments' 'guile')
  cd "$srcdir/gdb/build"
  make -C gdb/data-directory DESTDIR="$pkgdir" install
}
