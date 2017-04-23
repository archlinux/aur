# Maintainer: Gauthier B <gogoprog at gmail dot com>
pkgname=ddsviewer-git
pkgver=20170420
pkgrel=1
pkgdesc="DDS file viewer (DirectDraw Surface)"
arch=('i686' 'x86_64')
url="https://github.com/gogoprog/ddsviewer"
license=('GPL2')
depends=('sfml')
makedepends=('git' 'premake')
optdepends=()
provides=()
replaces=()
backup=()

_gitroot="https://github.com/gogoprog/ddsviewer"
_gitname="ddsviewer"

build() {
    # update/download git files
    cd ${srcdir}/
    msg "Connecting to the GIT server..."
    if [[ -d ${srcdir}/${_gitname} ]] ; then
        cd ${_gitname}/
        git stash
        git pull origin
        msg "The local files are updated..."
    else
        git clone ${_gitroot} ${_gitname}
    fi
    # checkout of actual/working branch
    cd ${srcdir}/${_gitname}
    git checkout master
    msg "GIT checkout done."

    cd build
    msg "Building..."
    premake4 gmake
    make clean || return 1
    make config=release
}

package() {
    mkdir -p ${pkgdir}/usr/bin/
    cp ${srcdir}/${_gitname}/build/ddsviewer ${pkgdir}/usr/bin/
}
