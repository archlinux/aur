# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=gnu-apl
pkgver=1.7
pkgrel=3
url="http://www.gnu.org/software/apl/"
pkgdesc="An (almost) complete implementation of ISO standard 13751"
arch=('i686' 'x86_64')
depends=('ncurses' 'postgresql-libs' 'gcc-libs' 'sqlite')
license=('GPL3')
source=("ftp://ftp.gnu.org/gnu/apl/apl-${pkgver}.tar.gz")
md5sums=('a06456f4aa9e349700da51c8efd14150')

prepare() {
    cd "$srcdir/apl-$pkgver"
    # The default color scheme is black-on-black in some terminals
    sed -i 's/^  Color.*ANSI/#&/' gnu-apl.d/preferences
    sed -i '0,/^# Color.*CURSES/{s/^# Color.*CURSES/Color\tCURSES/}' gnu-apl.d/preferences

    # SVN 908 (remove in 1.8)
    sed -i '888 s/ || / || nc == /g' src/Symbol.cc
}

build() {
    cd "$srcdir/apl-$pkgver"
    CFLAGS='-std=gnu99' ./configure --prefix=/usr 
    make PREFIX=/usr -j1
}

package() {
    cd "$srcdir/apl-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

