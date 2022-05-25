# Maintainer: Valerii Huz <ghotrix at gmail dot com>
pkgname=lc0-cudnn-git
_pkgname=lc0-cudnn
pkgver=0.28.2.r0.gfa5864bb
pkgrel=1
pkgdesc="CudNN version of Leela Chess Zero."
arch=('i686' 'x86_64')
url="https://lczero.org/"
license=('GPL3')
depends=('cuda' 'cudnn' 'protobuf')
makedepends=('git' 'meson>=0.46' 'ninja' 'gcc11')
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
    PATH=$PATH:/opt/cuda/bin ./build.sh release -Dblas=false -Dopencl=false -Dnvcc_ccbin=g++-11 || return 1
}

package() {
    cd "$srcdir/$_pkgname/build/release"
    install -Dm755 lc0 $pkgdir/usr/bin/lc0
}
