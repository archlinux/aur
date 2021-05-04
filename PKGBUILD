pkgname=puzzles-git
_pkgname=puzzles
pkgver=r1533.8ff394d
pkgrel=1
pkgdesc="Simon Tatham's Portable Puzzle Collection"
arch=('x86_64')
provides=(puzzles)
conflicts=(puzzles)
url="https://www.chiark.greenend.org.uk/~sgtatham/puzzles/"
license=('MIT')
makedepends=('cmake' 'git' 'perl' 'halibut')
depends=('gtk3')
source=("git://git.tartarus.org/simon/puzzles.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd ${srcdir}/${_pkgname}
    echo "#define VER \"$pkgver\"" > version.h
}

build() {
    cd ${srcdir}/${_pkgname}
    mkdir build && cd build
    cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DNAME_PREFIX="puzzles-"
    make
    cd ${srcdir}/${_pkgname}
    BINPREFIX="puzzles-" make -f Makefile.doc
}

package() {
    cd ${srcdir}/${_pkgname}/build
    make DESTDIR=${pkgdir} install
    cd ${srcdir}/${_pkgname}
    mkdir -p ${pkgdir}/usr/share/doc/puzzles/
    install -Dm644 puzzles.txt ${pkgdir}/usr/share/doc/puzzles/
    install -Dm644 puzzles.hlp ${pkgdir}/usr/share/doc/puzzles/
    install -Dm644 puzzles.chm ${pkgdir}/usr/share/doc/puzzles/
    install -Dm644 HACKING ${pkgdir}/usr/share/doc/puzzles/
    cd ${pkgdir}/usr/share
    mkdir -p icons/hicolor/48x48/apps
    mv pixmaps/* icons/hicolor/48x48/apps/
    rename -- '-48d24' '' icons/hicolor/48x48/apps/*
    rmdir pixmaps
    sed -i 's/-48d24//g' applications/*
}
