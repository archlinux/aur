# Maintainer: masutu dot arch at gmail dot com
pkgname='igel-git'
_pkgname=igel
pkgver=3.6.0.r42.gb717d35
pkgrel=1
pkgdesc="A free, open source UCI chess engine written in C++. "
arch=('i686' 'x86_64')
url="https://github.com/vshcherbyna/igel"
license=('GPL3')
makedepends=('git')
provides=('igel')
conflicts=('igel')
source=("${_pkgname}::git+https://github.com/vshcherbyna/igel.git"
	"network_file::https://github.com/vshcherbyna/igel/releases/download/3.5.0/c049c117")
md5sums=('SKIP'
         '9f04d6c667760894be59c555c2650734')
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
    cmake -DEVALFILE=network_file -DUSE_AVX2=1 -D_BTYPE=1 -DSYZYGY_SUPPORT=TRUE .
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 igel $pkgdir/usr/bin/igel
}
