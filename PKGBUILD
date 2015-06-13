# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Jaroslav Lichtblau <tu@dragonlord.cz>

pkgname=tome2-git
pkgver=20121104
pkgrel=1
pkgdesc="A dungeon crawler similar to Angband, based on the works of Tolkien."
arch=('i686' 'x86_64')
url="http://forums.te4.org/viewforum.php?f=28"
license=('custom')
depends=('libx11' 'ncurses' 'jansson')
makedepends=('git' 'cmake')
source=('git://gitorious.org/tome2/tome2.git'
        'LICENSE')
md5sums=('SKIP'
         '74183fd3880704df6ab64e4c2887b852')

_gitname="tome2"

pkgver() {
    cd "$_gitname"
    git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
    cd "$srcdir/$_gitname"
    sed -i 's/tome ${LIBS})/tome ${LIBS} m)/' src/CMakeLists.txt
    rm -rf build
    mkdir build
    cd build
    cmake -DSYSTEM_INSTALL:BOOL=true -DCMAKE_INSTALL_PREFIX='/usr/' ../
    make
}

package() {
    # todo: permissions for scores, more tome->tome2 renames
    cd "$srcdir/$_gitname/build"
    make DESTDIR="$pkgdir" install
    mv "$pkgdir/usr/bin/tome" "$pkgdir/usr/bin/tome2"

    # license
    install -D -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

