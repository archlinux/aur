# Maintainer: Yunhui Fu <yhfudev@gmail.com>

pkgname=ns3
pkgver=3.25
pkgrel=1
pkgdesc='Discrete-event network simulator for Internet systems'
arch=( 'i686' 'x86_64' 'armv6' 'armv6h' 'arm7h' )
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
    'flex' # for nsc
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
    "ns3-openflow-hg::hg+http://code.nsnam.org/openflow"
    "ns3-click-git::git+https://github.com/kohler/click"
    "ns3-brite-hg::hg+http://code.nsnam.org/jpelkey3/BRITE"
    #"ns3-nsc-hg::hg+https://secure.wand.net.nz/mercurial/nsc"
    )
md5sums=('55742e93177b662a874fb9dd04bb7c08' 'SKIP' 'SKIP' 'SKIP')
sha1sums=('493505203e8d3b74541bfe196aaa9dcd5806a8ff' 'SKIP' 'SKIP' 'SKIP')

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

    # compile openflow lib support
    cd $srcdir/ns3-openflow-hg
    grep -rl '/usr/bin/env python' . \
        | xargs sed -i 's|/usr/bin/env python|/usr/bin/python2|g'
    ./waf configure
    ./waf build

    # compile click support
    cd $srcdir/ns3-click-git
    #autoreconf -if
    ./configure --disable-linuxmodule --enable-nsclick --enable-wifi
    rm -rf bin
    make -j $(cat /proc/cpuinfo | grep processor | wc -l | awk '{print $0 + 1;}')

    # BRITE
    cd $srcdir/ns3-brite-hg
    make -j $(cat /proc/cpuinfo | grep processor | wc -l | awk '{print $0 + 1;}')

    if [ 0 = 1 ]; then
    # Network Simulation Cradle (NSC)
    cd $srcdir/ns3-nsc-hg
    grep -rl '/usr/bin/env python' . \
        | xargs sed -i 's|/usr/bin/env python|/usr/bin/python2|g'
    grep -rl '/usr/bin/env python' . \
        | xargs sed -i 's|/usr/bin/env python|/usr/bin/python2|g'
    #python2 scons.py
    SHLIBSUFFIX=.so ./scons.py
    fi
}

build()
{
    #cd "${srcdir}/${pkgname}"
    cd $srcdir/ns-allinone-$pkgver

    ./build.py \
        --build-options=--progress \
        --qmake-path=/usr/bin/qmake-qt4 \
        -- \
        --prefix=/usr \
        --with-python=/usr/bin/python2 \
        --progress \
        --enable-mpi \
        --enable-sudo \
        --with-nsclick=$srcdir/ns3-click-git \
        --with-openflow=$srcdir/ns3-openflow-hg \
        --with-brite=$srcdir/ns3-brite-hg \
        #--with-nsc=$srcdir/ns3-nsc-hg \
        #--enable-examples \
        #--enable-tests \
        #$(NULL)
}

verify_build()
{
    #cd "${srcdir}/${pkgname}"
    cd $srcdir/ns-allinone-$pkgver

    # openflow
    # https://www.nsnam.org/docs/release/3.13/models/html/openflow-switch.html
    ./waf --run openflow-switch
    ./waf --run "openflow-switch -v"

    # NS-3 Click Integration Support
    # https://www.nsnam.org/docs/models/html/click.html
    ./waf --run nsclick-simple-lan

    # brite
    # https://www.nsnam.org/wiki/BRITE_integration_with_ns-3
    ./waf --run 'brite-generic-example --verbose=1'

    # nsc
    # https://www.nsnam.org/docs/models/html/tcp.html?#network-simulation-cradle
    ./test.py -s ns3-tcp-interoperability
}

package()
{
    #cd "${srcdir}/${pkgname}/ns-3-dev"
    cd $srcdir/ns-allinone-$pkgver/ns-$pkgver
    ./waf install --destdir=$pkgdir/
}
