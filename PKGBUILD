# Maintainer: Felix Wiegand <koffeinflummi@gmail.com>

_pkgname="ncmpcpp"
pkgname="${_pkgname}-vim-git"
pkgver=2175.81cb7a4f
pkgrel=1
epoch=1
pkgdesc="An almost exact clone of ncmpc with some new features. Patched for vim-like keybindings."
arch=("i686" "x86_64")
url="https://rybczak.net/ncmpcpp/"
license=("GPL2")
depends=("ncurses" "libmpdclient>=2.14" "boost-libs")
makedepends=("git" "boost" "pkg-config")
optdepends=("curl: fetch lyrics"
    "taglib: tag editor"
    "fftw: frequency spectrum mode visualization"
    )
provides=("ncmpcpp")
conflicts=("ncmpcpp" "ncmpcpp-git" "ncmpcpp-xdg-config" "ncmpcpp-xdg-config-git" "ncmpcpp-color")
install=${pkgname}.install
source=("git+https://github.com/arybczak/ncmpcpp.git"
    "vim-keybindings.patch")
sha256sums=("SKIP"
    "7914343dca15bf60e89d014b805cc9ceefbeca2a067c0987a82383bc299d715a")

prepare() {
    cd "${_pkgname}"

    for _p in ${srcdir}/*.patch
    do
        msg2 "Applying $_p"
        patch -p1 -i $_p
    done
}

pkgver() {
    cd "${_pkgname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "${_pkgname}"
    ./autogen.sh
    ./configure BOOST_LIB_SUFFIX="" --prefix=/usr \
    --enable-clock --enable-outputs --enable-visualizer
    make
} 

package() {
    cd "${_pkgname}"
    make DESTDIR="$pkgdir/" install
}
