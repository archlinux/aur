# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>

pkgname='aqsis-git'
pkgdesc='RenderMan-compliant REYES renderer'
pkgver=20180401.51fd2a31
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL3')
url='https://github.com/aqsis/aqsis'

depends=('boost' 'libtiff' 'flex' 'bison' 'zlib' 'libjpeg' 'openexr')
makedepends=('git' 'cmake')

source=('git+https://github.com/aqsis/aqsis.git'
        'aqsis-boost.patch')
md5sums=('SKIP'
         '74b29b1843b8e16a01a968f8b3bf7273')

pkgver() {
    cd "$srcdir/aqsis"
    git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
    cd "$srcdir/aqsis"
    patch -p1 < "$srcdir/aqsis-boost.patch"
    git submodule update --init
}

build() {
    mkdir -pv "$srcdir/build"
    cd "$srcdir/build"
    cmake ../aqsis -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$srcdir/build" || exit 1
    make DESTDIR="${pkgdir}" install
}

