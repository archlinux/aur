# Maintainer: Gauthier B <gogoprog@gmail.com>
pkgname=qbat-qt5
pkgver=20140202
pkgrel=1
pkgdesc="Light qt5 tool to display battery stats in system tray"
arch=('i686' 'x86_64')
url="https://github.com/gogoprog/qbat"
license=('GPL2')
depends=('qt5-base')
makedepends=('git')
optdepends=()
provides=()
conflicts=('qbat')
replaces=()
backup=()

_gitroot="git://github.com/gogoprog/qbat.git"
_gitname="qbat"

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
    qmake
    make clean || return 1
    make all || return 1
    make DESTDIR="${pkgdir}" install || return 1
    msg "Build done."
}

package() {
    mkdir -p ${pkgdir}/usr/bin/
    cp ${srcdir}/${_gitname}/build/qbat ${pkgdir}/usr/bin/
}