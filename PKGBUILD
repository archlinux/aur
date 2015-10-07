# Maintainer: Yunhui Fu <yhfudev@gmail.com>

pkgname=ns3
pkgver=3.24
pkgrel=1
pkgdesc='Discrete-event network simulator for Internet systems'
arch=( 'i686' 'x86_64' 'arm' )
url='http://www.nsnam.org/'
license=('GPL')
depends=(
    'gsl' # GNU Scientific Library
    'gtk2'
    'libxml2' 'sqlite' 'boost' 'boost-libs'
    'doxygen'
    'graphviz' 'imagemagick' 'dia' 'qt4'
    'python2' 'python2-setuptools' 'python2-pydot' 'goocanvas' 'pygoocanvas' 'pygtk' 'python2-pygraphviz'
    'pygccxml-svn'
    'openmpi' # MPI for HPC
    )
makedepends=(
    'fakeroot'
    'findutils'
    )
optdepends=(
    'tcpdump' 'wireshark-gtk'
    'gdb' 'valgrind'
    'mercurial'
    'bzr'
    'texlive-bin'
    'python2-sphinx'
    'uncrustify' # utils/check-style.py style check program
    )
source=(
    "https://www.nsnam.org/release/ns-allinone-${pkgver}.tar.bz2"
    #"ns3-hg::hg+http://code.nsnam.org/ns-3-allinone"
    )
md5sums=('4ea86fc263fc309d6b7e493ee4dfcc4b')
sha1sums=('76d9d7a940ce27103ed496b93f220578be915906')

pkgver_git() {
    cd "${srcdir}/${pkgname}"
    local ver="$(git show | grep commit | awk '{print $2}' )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    echo ${ver:0:7}
}

pkgver_svn() {
    cd "${srcdir}/${pkgname}"
    local ver="$(svn info | grep Revision | awk '{print $2}' )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    echo ${ver:0:7}
}

#pkgver() {
#    pkgver_git
#}

prepare()
{
    #cd "${srcdir}/${pkgname}"
    cd $srcdir/ns-allinone-$pkgver

    # ./download.py -n ns-3-dev
    grep -rl '/usr/bin/env python' . \
        | xargs sed -i 's|/usr/bin/env python|/usr/bin/python2|g'
}

build()
{
    #cd "${srcdir}/${pkgname}"
    cd $srcdir/ns-allinone-$pkgver

    ./build.py \
        --build-options=--progress \
        --qmake-path=/usr/bin/qmake-qt4 \
        --enable-examples \
        --enable-tests \
        -- \
        --prefix=/usr \
        --with-python=/usr/bin/python2 \
        --progress \
        --enable-mpi \
        --enable-sudo \
        $(NULL)
}

package()
{
    #cd "${srcdir}/${pkgname}/ns-3-dev"
    cd $srcdir/ns-allinone-$pkgver/ns-$pkgver
    ./waf install --destdir=$pkgdir/
}

