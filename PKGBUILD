# Maintainer: Marcus Andersson <m.andersson0602 at gmail DOT com>

pkgname=ls-icons
pkgver=v8.27+46+gd3450c176
pkgrel=1
pkgdesc="A fork of coreutils with a modified ls that print icons"
url="https://github.com/sebastiencs/ls-icons"
arch=('any')
license=('GPL3')
depends=('icons-in-terminal')
makedepends=('git' 'gperf' 'rsync' 'clang')
provides=('ls-icons')
conflicts=('ls-icons')
source=('git://github.com/sebastiencs/ls-icons.git')
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --tags | sed 's/_/./g;s/-/+/g' 
}

prepare() {
    cd "$srcdir/$pkgname"
    
    sed -i 's DATA="${DATA}/icons-in-terminal/" DATA="/etc/icons-in-terminal/" ' bootstrap
    ./bootstrap

    # Execute this line _only_ if your terminal doesn't support true colours
    # https://gist.github.com/XVilka/8346728#now-supporting-truecolour
    #export CFLAGS=-DNO_TRUE_COLOURS=1
    
    export CC=clang CXX=clang++
}

build() {
    cd "$srcdir/$pkgname"

    ./configure \
        --prefix=/opt/coreutils

    make
}

package() {
    cd "$srcdir/$pkgname"

    make DESTDIR="${pkgdir}" install

    install=ls-icons.install
}
