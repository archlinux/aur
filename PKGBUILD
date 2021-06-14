# Maintainer: Philip Johansson <philipphuket at gmail dotcom>
pkgname=tuidoku-git
_pkgname=tuidoku
pkgver=r148.20d4dbe
pkgrel=1
pkgdesc="Play, solve and generate sudoku puzzles in the console"
arch=('x86_64')
url="https://github.com/flyingpeakock/tuidoku"
license=('MIT')
depends=(ncurses git)
makedepends=(gcc)
provides=("tuidoku")
replaces=("console_sudoku")
source=("git+https://github.com/flyingpeakock/tuidoku.git")
noextract=("${source[@]##*/}")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    # This package provides a mechanism to edit the file
    # config.h before installation.

    if [ -e "$BUILDDIR/config.h" ]
    then
        printf "applying configuration\n"
        cp "$BUILDDIR/config.h" "$srcdir/tuidoku/src/config.h"
        if [ -e "$srcdir/tuidoku-bin" ]
        then
            rm "$srcdir/tuidoku-bin"
        fi
    else
        msg="This package can be configured by editing config.h "
        msg+="Documentation can be found in the comments."
        warning $msg
        cp "$_pkgname/src/config.h" "$BUILDDIR/"
    fi
}

build() {
	cd "$srcdir"
        g++ -O3 -pthread ./tuidoku/src/*.cpp -lncursesw -o tuidoku-bin
}

package() {
        cd "$srcdir"
        install -Dm755 tuidoku-bin $pkgdir/usr/bin/tuidoku
        install -Dm644 ./tuidoku/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
