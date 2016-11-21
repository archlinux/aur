# Maintainer: Felix Wiegand <koffeinflummi@gmail.com>

_pkgname="ncmpcpp"
pkgname="${_pkgname}-vim-git"
pkgver=2053.ba83b9d
pkgrel=1
epoch=1
pkgdesc="An almost exact clone of ncmpc with some new features. Patched for vim-like keybindings."
arch=("i686" "x86_64")
url="http://unkart.ovh.org/ncmpcpp/"
license=("GPL2")
depends=("ncurses" "libmpdclient>=2.8" "boost-libs")
makedepends=("git" "boost" "pkg-config")
optdepends=("curl: fetch lyrics"
    "taglib: tag editor"
    "fftw: frequency spectrum mode visualization"
    )
provides=("ncmpcpp")
conflicts=("ncmpcpp" "ncmpcpp-git" "ncmpcpp-xdg-config" "ncmpcpp-xdg-config-git" "ncmpcpp-color")
install=${pkgname}.install
source=("git+git://repo.or.cz/${_pkgname}.git"
    "vim-keybindings.patch")
sha256sums=("SKIP"
    "c2234241790269c452a085e4071c8770dbaed18960734c9b764a88811d6e0759")

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
