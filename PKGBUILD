# Maintainer: Valerii Huz <ghotrix at gmail dot com>
pkgname=lc0-blas-git
_pkgname=lc0-blas
pkgver=1
pkgrel=1
pkgdesc="BLAS version of Leela Chess Zero."
arch=('any')
url="https://lczero.org/"
license=('GPLv3')
depends=('openblas' 'protobuf')
makedepends=('git' 'meson>=0.46' 'ninja' 'clang' 'openblas-cblas-git')
source=("${_pkgname}::git+https://github.com/LeelaChessZero/lc0.git#branch=master")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git rev-list --count HEAD
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    git checkout $(git tag|grep -v rc|sort -rh|head -n 1)
    git submodule update --init --recursive
}

build() {
    cd "${srcdir}/${_pkgname}"
    CC=clang CXX=clang++ ./build.sh release -Dopencl=false -Ddefault_library=static || return 1
}

package() {
    cd "$srcdir/$_pkgname/build/release"
    install -Dm755 lc0 $pkgdir/usr/bin/lc0
}
