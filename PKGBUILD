# Maintainer: ThePuzzlemaker <tpzker at thepuzzlemaker dot info>

pkgname=zmqpp-git
pkgver=4.2.git040420
pkgrel=1
commit_hash=85ae96020f2376c53d2176e04e88e8e51021b748
pkgdesc="ZMQPP's git 'develop' branch"
arch=('x86_64')
url='https://github.com/zeromq/zmqpp'
licence=('MIT')
depends=('libsodium' 'zeromq')
makedepends=('make')
provides=('libzmqpp')
conflicts=("zmqpp")
source=("git+$url#commit=$commit_hash")
md5sums=('SKIP')

prepare() {
    cd zmqpp
    git submodule update --init --recursive
    PKGDIR_ESCAPE=$(echo "${pkgdir}" | sed 's/\//\\\//g')
    sed -i "s/\/usr\/local/${PKGDIR_ESCAPE}\/usr/g" Makefile
}

build() {
    cd zmqpp
    make
    make client
}

package() {
    cd zmqpp
    make install
    # basic fix to #237, I sent a PR to fix it in the makefile
    cd "${pkgdir}/usr"
    mv bin zmqpp
    mkdir -p bin
    mv zmqpp bin
}
