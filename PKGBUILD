# Maintainer: pingplug <aur at pingplug dot me>
pkgname=vnote3-git
pkgver=r1498.db341b55
pkgrel=1
pkgdesc="A Vim-inspired note-taking application, especially for Markdown."
arch=('x86_64')
url='https://github.com/vnotex/vnote'
license=('LGPL')
depends=('qt5-webengine' 'qt5-svg')
makedepends=('git')

source=(
    "git+https://github.com/vnotex/vnote"
    "git+https://github.com/vnotex/vtextedit"
    "git+https://github.com/vnotex/syntax-highlighting"
    )
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

_gitname="vnote"

pkgver() {
    cd "$srcdir/$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_gitname"
    mv "$srcdir/vtextedit" libs
    cd "libs/vtextedit"
    mv "$srcdir/syntax-highlighting" src/libs
}

build() {
    cd "$srcdir/$_gitname"
    mkdir build
    cd build
    qmake-qt5 ../vnote.pro
    make
}

package() {
    cd "$srcdir/$_gitname/build"
    make INSTALL_ROOT="$pkgdir" install
}
