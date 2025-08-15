# Maintainer: Roberr L Box <robertbox514@gmail.com> 
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Nathan O <ndowens.aur at gmail dot com>

pkgname=i7z
pkgver=0.28
pkgrel=1
pkgdesc="A better i7 (and now i3, i5) reporting tool for Linux"
arch=('x86_64')
license=('GPL-2.0-only')
depends=('ncurses')
makedepends=('qt5-base' 'git' 'clang')
optdepends=('qt5-base: for i7z-gui')
url="https://github.com/afontenot/i7z"
source=(git+https://github.com/afontenot/i7z.git#tag=v${pkgver}
        i7z-qt5.patch
        i7z-global_ts-multiple-defines.patch)
sha512sums=('b1e13e35df508fdc82f6a2b23aa0389463f9d3f08f6f7fc3d5a563e1ec0cd389271f227d5929ee4a10099b3c1363d4552443614b57970f3a5e64f002aaf029a1'
            'd22b28c9e0e1c269aef71a1951e23d04299bc3bde7f882bd584c468bddd04189c6ec9d2a81702dbb784286d61631e099ce54486799d373183d15f796f9ce4af3'
            'd53141bb3a5a2d5a6908ba433ac0fa7a6ff711032e77e70d088e348834501db9f20e0c4c7778fb909f552e4d91cdd3467eb415aa4ccab0de1caa9ae6e1130b6a')

prepare() {
    cd $pkgname
    patch -p1 -i ../i7z-qt5.patch # Port to Qt5
    patch -p1 -i ../i7z-global_ts-multiple-defines.patch # global_ts violates one-defintion rule
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
}
