# Maintainer: Ambition_echo <ambition_echo@outlook.com>

name=colutius-desktop
pkgname=colutius-desktop-git
pkgver=r47.ad78fc0
pkgrel=1
pkgdesc="A cross-platform, easy-to-use and beautiful IRC client"
arch=('x86_64')
url="https://github.com/colutius/colutius-desktop"
license=('GPL3')

depends=('qt6-base' 'qt6-svg')
makedepends=('cmake' 'git' 'make')
optdepends=('fcitx5-qt: fcitx5 support')

source=("git+$url.git")
sha256sums=("SKIP")

pkgver() {
    cd $name
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd $srcdir/$name
    git submodule update --init
}

build() {
    mkdir build
    cd build
    cmake ../$name
    make
}

package() {
    cd $name
    sed -i "s/\/opt\/colutius-desktop/\/opt\/colutius-desktop-git/g" ./pkg/$name.desktop
    install -Dm644 ./resource/img/icon.svg $pkgdir/usr/share/icons/colutius.svg
    install -Dm644 ./pkg/$name.desktop $pkgdir/usr/share/applications/$name.desktop
    install -Dm666 ./README.md $pkgdir/opt/$pkgname/logs/README.md
    chmod 777 $pkgdir/opt/$pkgname/logs
    cd ../build
    install -D ./$name $pkgdir/opt/$pkgname/$name
    install -D ./libs/* -t $pkgdir/usr/lib
}
