# Maintainer: CUI Hao <cuihao.leo@gmail.com>
pkgname=marketo-git
_pkgname=marketo
pkgdesc="A note-taking KDE application with the power of lightweight markup language"
pkgver=r145.ad2f92d
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/sadhen/marketo"
license=('GPL3')
provides=('marketo')
conflicts=('marketo')
depends=("libmdcpp" "ktexteditor" "hicolor-icon-theme" "kfilemetadata" "kdewebkit")
makedepends=('git' 'cmake' 'extra-cmake-modules')
source=("git://github.com/sadhen/${_pkgname}.git")
install="${_pkgname}.install"
md5sums=(SKIP)

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    git submodule init
    git submodule update

    rm -rf "$srcdir/build"
    mkdir -p "$srcdir/build"
    cd "$srcdir/build"

    cmake "../${_pkgname}" \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir" install
}
