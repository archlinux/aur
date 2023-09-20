# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lame-svn
pkgver=r6507
pkgrel=4
pkgdesc="A high quality MPEG Audio Layer III (MP3) encoder"
arch=('i686' 'x86_64')
url="https://lame.sourceforge.io/"
license=('LGPL')
depends=('glibc' 'mpg123' 'ncurses')
makedepends=('subversion' 'nasm')
provides=("lame=$pkgver" 'libmp3lame.so')
conflicts=('lame')
options=('staticlibs')
source=("svn+https://svn.code.sf.net/p/lame/svn/trunk"
        "lame.pc.in::https://gitlab.archlinux.org/archlinux/packaging/packages/lame/-/raw/main/lame.pc.in")
sha256sums=('SKIP'
            'SKIP')


prepare() {
  cd "trunk"

  _version=$(sed -rn 's|AC_INIT\(\[.*\],\[([0-9\.]+)\].*$|\1|p' lame/configure.in)
  sed -e "s/VERSION/$_version/" "$srcdir/lame.pc.in" > "$srcdir/lame.pc"
}

pkgver() {
  cd "trunk"

  _rev="$(svnversion | sed 's/[^0-9]+//')"
  printf "r%s" "$_rev"
}

build() {
  cd "trunk/lame"

  ./configure \
    --prefix="/usr" \
    --enable-nasm
  make
}

package() {
  cd "trunk/lame"

  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/lame.pc" -t "$pkgdir/usr/lib/pkgconfig"
}
