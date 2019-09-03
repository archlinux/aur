# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
pkgname=dgsh-git
pkgver=r1549.df703ef
pkgrel=1
pkgdesc="Directed Graph Shell"
arch=('any')
url="http://www.dmst.aueb.gr/dds/sw/dgsh/"
license=('Apache')
depends=()
makedepends=(
    'make'
    'automake'
    'gcc'
    'gperf'
    'libtool'
    'pkg-config'
    'texinfo'
    'help2man'
    'gettext'
    'git'
    'bison'
    'rsync'
)
checkdepends=(
    'check'
    'words'
    'fftw'
    'tcsh'
)
optdepends=(
    'graphviz: visualize graphs'
)
source=('git://github.com/dspinellis/dgsh.git')
md5sums=('SKIP')

pkgver() {
    cd 'dgsh'
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd 'dgsh'
    git submodule update --init
}

build() {
    cd 'dgsh'
    make $MAKEFLAGS PREFIX="/usr" config
    make $MAKEFLAGS
}

check() {
    cd 'dgsh'
    make $MAKEFLAGS -j1 test # tests must be run sequentially, so override any -jN in $MAKEFLAGS
}

package() {
    cd 'dgsh'
    make DESTDIR="$pkgdir/" install
    # the build leaves over some empty directories and sometimes the permissions differ, which produces warnings on install, so clean those up
    find "$pkgdir" -type d -empty -delete
}
