# Maintainer: Philip Johansson <philipphuket at gmail dotcom>
pkgname=tuidoku-git
_pkgname=tuidoku
pkgver=r230.7a7dcfe
pkgrel=1
pkgdesc="Play, solve and generate sudoku puzzles in the console"
arch=('x86_64')
url="https://github.com/flyingpeakock/tuidoku"
license=('MIT')
depends=(ncurses git ninja)
makedepends=(gcc cmake)
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
        msg='Configuration found in build directory. '
        msg+='Applying custom configuration.'
        warning "$msg"
        cp "$BUILDDIR/config.h" "$srcdir/tuidoku/src/config.h"
        if [ -e "$srcdir/tuidoku-bin" ]
        then
            rm "$srcdir/tuidoku-bin"
        fi
    else
        msg='This package can be configured by editing config.h '
        msg+='Documentation can be found in the comments. '
        msg+='Sometimes changes are made to the config that '
        msg+='are required for building. If a build fails remove the '
        msg+='old config.h file.'
        warning "$msg"
        cp "$_pkgname/src/config.h" "$BUILDDIR/"
    fi
}

build() {
	    #cd "$srcdir/$_pkgname"
        #g++ -Ofast -pthread ./tuidoku/src/*.cpp -lncursesw -o tuidoku-bin
        cmake --no-warn-unused-cli -B build -S "$_pkgname"
        cmake --build build --config Release --target all
}

package() {
        #install -Dm755 tuidoku-bin $pkgdir/usr/bin/tuidoku
        install -Dm755 build/$_pkgname $pkgdir/usr/bin/$_pkgname
        install -Dm644 $srcdir/$_pkgname/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
