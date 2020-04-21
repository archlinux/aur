# Maintainer: Fenrihr <fmvm483@gmail.com>

pkgname=moneymanagerex-1.3.4-branch
_gitname=moneymanagerex
pkgver=1.3.4.rc.7.r14.653eaca3
pkgrel=1
pkgdesc="MoneyManagerEx 1.3.4 - Release 7 with DB v.7. Requiere `sudo` access"
arch=('i686' 'x86_64')
url="http://www.moneymanagerex.org/"
license=('GPL')
depends=('wxgtk3' 'lua' 'rapidjson' 'webkit2gtk')
makedepends=('cmake' 'git' 'boost' 'gettext' 'lsb-release' )
optdepends=('cups: for printing support')
replaces=('mmex')
provides=('moneymanagerex')
conflicts=('moneymanagerex')
source=(git+https://github.com/moneymanagerex/moneymanagerex.git#branch=v1.3.4)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "$srcdir/$_gitname"
    mkdir -p "build"
    # solved "Could NOT find wxWidgets" error caused by broken wxgtk3
    sudo ln -sf /usr/bin/wx-config{-gtk3,} || true
    git submodule update --init
}

build() {
    cd "$srcdir/$_gitname/build"
    export MAKEFLAGS=-j4
    cmake -DCMAKE_BUILD_TYPE=Release ..
    cmake --build . --target package
}

package() {
    cd "$srcdir/$_gitname/build"

    make DESTDIR="${pkgdir}/" install
}
 
