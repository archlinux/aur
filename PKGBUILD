# Maintainer: Philip Johansson <philipphuket at gmail dotcom>
pkgname=solitty-git
_pkgname=solitty
pkgver=r32.39c72b3
pkgrel=1
pkgdesc="Play solitaire in the console"
arch=('x86_64')
url="https://github.com/flyingpeakock/solitty"
license=('MIT')
depends=(ncurses git)
makedepends=(gcc)
provides=("solitty")
source=("git+https://github.com/flyingpeakock/solitty.git")
noextract=("${source[@]##*/}")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    # This package provides a mechanism to edit the file
    # config.h before installation.

    if [ -e "$BUILDDIR/Config.h" ]
    then
        msg='Configuration found in build directory. '
        msg+='Applying custom configuration.'
        warning "$msg"
        cp "$BUILDDIR/Config.h" "$srcdir/solitty/src/Config.h"
        if [ -e "$srcdir/solitty-bin" ]
        then
            rm "$srcdir/solitty-bin"
        fi
    else
        msg='This package can be configured by editing config.h '
        msg+='Documentation can be found in the comments.'
        msg+='Sometimes changes are made to the config that '
        msg+='are required for building. If a build fails remove the '
        msg+='old config.h file.'
        warning "$msg"
        cp "$_pkgname/src/Config.h" "$BUILDDIR/"
    fi
}

build() {
	cd "$srcdir"
        g++ -O2 -pthread ./solitty/src/*.cpp -lncursesw -o solitty-bin
}

package() {
        cd "$srcdir"
        install -Dm755 solitty-bin $pkgdir/usr/bin/solitty
        install -Dm644 ./solitty/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
