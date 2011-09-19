#Contributor: Anselmo L. S. Melo <anselmolsm @ gmail.com>

pkgname=iceberg-git
pkgver=20150114
pkgrel=2
pkgdesc=""
url="https://github.com/hugopl/Iceberg"
license="GPL"
depends=('gcc' 'qt5-base' 'icecream')
arch=('i686' 'x86_64')
source=()
md5sums=()
makedepends=('git' 'cmake>=2.8.10.2' 'icecream' 'qt5-base')
provides=('iceberg')

_gitroot='git://github.com/hugopl/Iceberg.git'
_gitname='Iceberg'
_buildir=${_gitname}-build

build() {
    msg "Starting git clone..."

    if [ -d ${srcdir}/${_gitname} ]; then
        cd ${srcdir}/${_gitname} && git fetch && git reset --hard origin/master
    else
        git clone ${_gitroot} ${srcdir}/${_gitname}
    fi

    msg 'GIT checkout done or server timeout.'

    if [ -d  ${srcdir}/${_buildir} ]; then
        msg 'Cleaning previous build...'
        rm -rf ${srcdir}/${_buildir}
    fi
    mkdir -p ${srcdir}/${_buildir}

    msg 'Generating necessary files...'

    cd ${srcdir}
    export PKG_CONFIG_PATH=/usr/lib/icecream/lib/pkgconfig/:$PKG_CONFIG_PATH

    cd ${srcdir}/${_buildir}
    cmake -DCMAKE_INSTALL_PREFIX=$pkgdir/opt/iceberg ${srcdir}/$_gitname || return 1
    make || return 1
}

package() {
    cd ${srcdir}/${_buildir}
    mkdir -p $pkgdir/usr/bin
    make install || return 1
    ln -s /opt/iceberg/bin/iceberg $pkgdir/usr/bin/iceberg
}
