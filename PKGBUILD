# $Id$
# Maintainer: misson20000 <xenotoad at xenotoad dot n e t>

_target=twili
pkgname=gdb-twili-git
pkgver=97040.65d9087ab0
pkgrel=1
pkgdesc='The GNU Debugger for Twili'
arch=(i686 x86_64)
url='https://github.com/misson20000/twili-gdb'
license=(GPL3)
depends=(xz ncurses expat python guile2.0 gdb-common)
options=(!emptydirs)
source=("git+https://github.com/misson20000/twili-gdb.git")
sha256sums=("SKIP")

pkgver() {
  cd $srcdir/twili-gdb/
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd $srcdir/twili-gdb/
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  cd $srcdir/twili-gdb/

  ./configure \
    --target=$_target \
    --prefix=/usr \
    --enable-languages=c,c++ \
    --disable-multilib \
    --enable-interwork \
    --with-system-readline \
    --disable-nls \
    --with-python=/usr/bin/python3 \
    --with-guile=guile-2.0 \
    --with-system-gdbinit=/etc/gdb/gdbinit \
    --enable-targets=$_target \
    --disable-sim

  make
}

package() {
  cd $srcdir/twili-gdb

  make DESTDIR="$pkgdir" install-gdb

  # Avoid conflicts with gdb and gdb-common...
  rm -r "$pkgdir"/usr/share/{info,gdb,man/man5}
  rm -r "$pkgdir"/usr/include/gdb
}
