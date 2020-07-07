# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Nathan O <ndowens.aur at gmail dot com>

pkgname=i7z
pkgver=0.27.2.git1
pkgrel=8
pkgdesc="A better i7 (and now i3, i5) reporting tool for Linux"
arch=('x86_64')
license=('GPL2')
depends=('ncurses')
makedepends=('qt5-base' 'git' 'clang')
optdepends=('qt5-base: for i7z-gui')
url="https://github.com/afontenot/i7z"
source=(git://github.com/afontenot/i7z.git#commit=dfbcd77
        i7z-qt5.patch)
sha512sums=('SKIP'
            'd22b28c9e0e1c269aef71a1951e23d04299bc3bde7f882bd584c468bddd04189c6ec9d2a81702dbb784286d61631e099ce54486799d373183d15f796f9ce4af3')

prepare() {
    cd $pkgname

    patch -p1 -i ../i7z-qt5.patch # Port to Qt5
}

build() {
    cd $pkgname
    export CC=clang
    make

    cd src/GUI
    qmake-qt5 .
    make
}
package() {
    cd $pkgname

    install -Dm 755 i7z "$pkgdir"/usr/bin/i7z
    install -Dm 755 src/GUI/i7z_GUI "$pkgdir"/usr/bin/i7z-gui
    install -Dm 644 doc/i7z.man "$pkgdir"/usr/share/man/man1/i7z.1
    gzip --best "$pkgdir"/usr/share/man/man1/i7z.1
}
