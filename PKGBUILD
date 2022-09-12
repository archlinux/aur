# Maintainer: goetzc
# Contributor: Gaetan Bisson <bisson@archlinux.org
# Contributor: afontenot

pkgname=squishyball
pkgver=r78.27590fe
pkgrel=1
pkgdesc='Perform ABX audio sample comparison testing on the command line'
url='https://gitlab.xiph.org/xiph/squishyball'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('opusfile' 'ncurses' 'libvorbis' 'flac' 'libao')
source=("git+https://gitlab.xiph.org/xiph/squishyball.git"
        "https://gitlab.xiph.org/xiph/squishyball/uploads/5609ceaf85ebb6dc297c0efe61b9a1b7/0001-mincurses.c-use-ncurses-API-to-enter-raw-mode-ncurse.patch")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  # fix building against ncurses-6.3+
  patch -Np1 -i "$srcdir/0001-mincurses.c-use-ncurses-API-to-enter-raw-mode-ncurse.patch"
}

build() {
  cd "$pkgname"
  sed -i 's:@MANDIR@:/usr/share/man:' Makefile.am
  ./autogen.sh --prefix='/usr'
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="${pkgdir}" install
}

sha256sums=('SKIP'
            '9eb5e820069867a6b36c06b71b941d5c82aff6bd0f966be588cbcf203e29aae6')
