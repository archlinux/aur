# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=fexl-git
pkgver=20131020
pkgrel=1
pkgdesc="A small embeddable interpreter for a programming language based on functions."
url="http://fexl.com/code/"
arch=('i686' 'x86_64')
license=("GPL3")
#depends=()
makedepends=('git' 'python2')
source=('git://github.com/chkoreff/Fexl'
        'http://kmkeen.com/tmp/ldsed')
md5sums=('SKIP'
         'dcdf078713e95432f2ab8be9fb501fe3')

_gitname="Fexl"

pkgver() {
    cd "$_gitname"
    git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}


build() {
    cd "$srcdir/$_gitname"
    # everything about the build script continues to be broken
    sed -i 's/$options$list_obj/& -ldl/g' build
    sed -i 's/^.*chown/echo #&/g' build
}

package() {
    cd "$srcdir/$_gitname"
    ./build install in "$pkgdir/usr"

    # fix the broken library links
    python2 "$srcdir/ldsed" "$pkgdir" "$pkgdir/usr/bin/fexl"
}


