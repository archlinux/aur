# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: mrshpot <mrshpot at gmail dot com>
# Contributor: Michael Fellinger <m.fellinger@gmail.com>

pkgname=smalltalk
pkgver=3.2.91
pkgrel=13
pkgdesc='GNU Smalltalk interpreter and libraries'
url='https://www.gnu.org/software/smalltalk/'
license=(GPL LGPL)
arch=(x86_64)
options=(!emptydirs staticlibs)
depends=(gmp libffi libltdl libsigsegv sdl)
makedepends=(freeglut gdbm git glew glu gmp mesa sqlite tk zip)
# Use latest commit where "make check" works. Found by using "git bisect".
_commit=edb6bad6950c787f4b4c7f8ac5f7047ac1e8b984
source=("git+https://git.savannah.gnu.org/git/smalltalk.git#commit=$_commit")
b2sums=('SKIP')
optdepends=('sqlite: database in a file'
            'tk: for gst-blox')

prepare() {
  cd $pkgname
  autoreconf -iv
  sed 's/int yylineno = 1;//g' -i libgst/gen{bc,pr,vm}-scan.l
  sed '/XML-Expat/d' -i tests/testsuite.at
}

build() {
  cd $pkgname
  export CFLAGS="$CFLAGS -ffat-lto-objects -Wl,--allow-multiple-definition -w"
  ./configure \
    --enable-gtk=no \
    --enable-libsdl=yes \
    --libexecdir=/usr/lib/smalltalk \
    --prefix=/usr \
    --with-imagedir=/var/lib/smalltalk \
    --with-readline \
    --with-system-libffi \
    --with-system-libsigsegv \
    --with-tk \
    --with-tcl \
    --with-x \
    --without-emacs
  echo '#define USE_INTERP_RESULT 1' >> config.h
  make -j1
}

check() {
  make -C $pkgname check -j1
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  # Fix manpage symlink
  rm -f "$pkgdir/usr/share/man/man1/gst-reload.1"
  ln -s gst-load.1 "$pkgdir/usr/share/man/man1/gst-reload.1"
  # Remove gst-browser, ref FS#76224
  rm -f "$pkgdir/usr/"{bin/gst-browser,share/man/man1/gst-browser.1}
}
