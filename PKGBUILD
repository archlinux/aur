# Maintainer: Ambition_echo <ambition_echo@outlook.com>

name=colutius-desktop
pkgname=colutius-desktop-git
pkgver=r34.9b3fda3
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
    cd ..&&mkdir build&&cd build
    touch Colutius_log.txt
}

build() {
    cd build
    cmake ../$name
    make
}

package() {
    cd $name
    install -Dm644 ./resource/img/icon.svg $pkgdir/usr/share/icons/colutius.svg
    install -Dm644 ./pkg/$name.desktop $pkgdir/usr/share/applications/$name.desktop
    cd ../build
    install -D ./$name -t $pkgdir/opt/$name
    install -Dm644 ./libs/* $pkgdir/opt/$name/libs
    install -Dm666 ./Colutius_log.txt $pkgdir/opt/$name/Colutius_log.txt
}
