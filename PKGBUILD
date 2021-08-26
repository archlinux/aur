# Maintainer: Valerii Huz <ghotrix at gmail dot com>
pkgname=lc0-blas-git
_pkgname=lc0-blas
pkgver=0.28.0.r0.g3982cc0e
pkgrel=1
pkgdesc="BLAS version of Leela Chess Zero."
arch=('any')
url="https://lczero.org/"
license=('GPL3')
depends=('openblas' 'protobuf')
makedepends=('git' 'meson>=0.46' 'ninja' 'openblas-cblas-git')
source=("${_pkgname}::git+https://github.com/LeelaChessZero/lc0.git#branch=master")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    git checkout $(git tag|grep -v rc|sort -rh|head -n 1)
    git submodule update --init --recursive
}

build() {
    cd "${srcdir}/${_pkgname}"
    CC=gcc CXX=g++ ./build.sh release -Dopencl=false -Ddefault_library=static || return 1
}

package() {
    cd "$srcdir/$_pkgname/build/release"
    install -Dm755 lc0 $pkgdir/usr/bin/lc0
}
