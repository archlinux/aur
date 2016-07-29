# Maintainer: Michael Zimmermann <sigmaepsilon92@gmail.com>

_gitroot="https://github.com/M1cha/edk2-linux-toolchain"
_gitname="edk2-linux-toolchain"
_gitbranch="master"
pkgname=edk2-linux-toolchain
pkgver=0.1
pkgrel=1
pkgdesc="minimal EDKII including the makeefi tool for easily building UEFI apps and drivers"
url="https://github.com/M1cha/edk2-linux-toolchain"
arch=('i686' 'x86_64')
license=('BSD')
makedepends=('git' 'make' 'cmake')
provides=('makeefi')
conflicts=('makeefi')
options=('!strip')
source=(
    "${_gitname}::git+${_gitroot}#branch=${_gitbranch}"
    "edk2::git+https://github.com/M1cha/edk2#branch=edk2-linux-toolchain"
)
md5sums=('SKIP' 'SKIP')

build() {
    # makeefi
    cd "${srcdir}/${_gitname}/makeefi"
    cmake .
    make

    # edk2
    cd "${srcdir}/${_gitname}"
    mkdir -p ./miniedk2
    ./create_miniedk2 "${srcdir}/edk2" ./miniedk2
}

package() {
    # makeefi
    cd "${srcdir}/${_gitname}/makeefi"
    install -D -m755 makeefi "${pkgdir}/usr/bin/makeefi"

    # edk2
    mkdir -p "$pkgdir/opt"
    cp -rf "${srcdir}/${_gitname}/miniedk2" "$pkgdir/opt/edk2"
}
