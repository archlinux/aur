# Maintainer: masutu dot arch at gmail dot com
pkgname='igel-git'
_pkgname=igel
pkgver=3.0.5.r6.g301fc70
pkgrel=2
pkgdesc="A free, open source UCI chess engine written in C++. "
arch=('i686' 'x86_64')
url="https://github.com/vshcherbyna/igel"
license=('GPL3')
makedepends=('git')
provides=('igel')
conflicts=('igel')
source=("${_pkgname}::git+https://github.com/vshcherbyna/igel.git"
	"network_file::https://github.com/vshcherbyna/igel/releases/download/3.0.5/ign-1-d593efbd")
md5sums=('SKIP'
         'bb2def39ed3bf9df1d714913e882e712')
pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    mv network_file "${srcdir}/${_pkgname}"
    cd "${srcdir}/${_pkgname}"
    git submodule update --init --recursive
}

build() {
    cd "${srcdir}/${_pkgname}"
    cmake -DEVALFILE=network_file -DEVAL_NNUE=1 -DUSE_PEXT=1 -DUSE_AVX2=1 -D_BTYPE=1 -DSYZYGY_SUPPORT=TRUE .
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 igel $pkgdir/usr/bin/igel
}
