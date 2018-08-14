# Maintainer: Yunhui Fu <yhfudev@gmail.com>

USE_DEV=1

pkgname=ns3-hg
pkgver=r13735
pkgrel=1
pkgdesc='Discrete-event network simulator for Internet systems'
arch=( 'i686' 'x86_64' 'armv6' 'armv6h' 'arm7h' )
url='http://www.nsnam.org/'
license=('GPL')
depends=(
    'gsl' # GNU Scientific Library
    'libxml2' 'sqlite' 'boost' 'boost-libs'
    'doxygen'
    'graphviz' 'imagemagick' 'dia' 'qt4'
    'python2' 'python2-setuptools' 'python2-pydot' 'goocanvas' 'pygoocanvas' 'pygtk' 'python2-pygraphviz'
    'pygccxml'
    'openmpi' # MPI for HPC
    'flex' # for nsc
    'valgrind'
    )
makedepends=(
    'mercurial' 'bzr' 'git'
    'binutils'
    'fakeroot'
    'findutils'
    )
optdepends=(
    'tcpdump' 'wireshark-gtk'
    'gdb'
    'texlive-bin'
    'python2-sphinx'
    'uncrustify' # utils/check-style.py style check program
    )
provides=('ns3')
source=(
    #"https://www.nsnam.org/release/ns-allinone-${pkgver}.tar.bz2"
    "ns3-hg::hg+http://code.nsnam.org/ns-3-allinone"
    "ns3-openflow-hg::hg+http://code.nsnam.org/openflow"
    "ns3-click-git::git+https://github.com/kohler/click"
    "ns3-brite-hg::hg+http://code.nsnam.org/jpelkey3/BRITE"
    "ns3-nsc-hg::hg+https://secure.wand.net.nz/mercurial/nsc"
    "ns3-dev-hg::hg+http://code.nsnam.org/ns-3-dev"
    "ns3-netanim-hg::hg+http://code.nsnam.org/netanim"
    "ns3-bake-hg::hg+http://code.nsnam.org/bake"
    "pybindgen-git::git+https://github.com/gjcarneiro/pybindgen.git"
    )

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

pkgver_hg() {
    #cd "${srcdir}/${pkgname}"
    cd "${srcdir}/ns3-dev-hg/"
    local ver="$(hg log | grep changeset | head -n 1 | awk '{print $2}' | awk -F: '{print $1}' )"
    printf "r%s" "${ver//[[:alpha:]]}"
}

pkgver() {
    pkgver_hg
}

prepare()
{
    if [ ! "${USE_DEV}" = "0" ]; then
        # setup: bake, netanim, pybindgen, and ns-3-dev
        cd "${srcdir}/${pkgname}"

        sed '1s|^|#!/usr/bin/env python2\n|' -i ${srcdir}/ns3-dev-hg/bindings/python/wscript
        sed -e 's|#!/usr/bin/env python$|#!/usr/bin/env python2|g' -i ${srcdir}/ns3-dev-hg/waf
    else
        # already include source for netanim, pybindgen, and ns3-xxx
        cd $srcdir/ns-allinone-$pkgver

        sed '1s|^|#!/usr/bin/env python2\n|' -i ns3-$pkgver/bindings/python/wscript
        sed -e 's|#!/usr/bin/env python$|#!/usr/bin/env python2|g' -i ns3-$pkgver/waf

    fi

    if [ 0 = 1 ]; then
        cd ${srcdir}/ns3-dev-hg/ && patch -p1 -i ${srcdir}/ns3-dev-arch-pygccxml-detect.patch && echo ""
        cd -
        cd ${srcdir}/ns3-dev-hg/ && patch -p1 -i ${srcdir}/ns3-dev-arch-pybindgen-detect.patch && echo ""
        cd -
    fi

    echo "Fix python(3) for ns3"
    grep -rl '/usr/bin/env python' . \
        | xargs sed -e 's|/usr/bin/env python$|/usr/bin/env python2|g' -i

    if [ ! "${USE_DEV}" = "0" ]; then
        echo "update the dev links ..."
        rm -f ns-3-dev
        rm -f netanim
        rm -f bake
        rm -f pybindgen
        ln -sf ../ns3-dev-hg/     ns-3-dev
        ln -sf ../ns3-netanim-hg/ netanim
        ln -sf ../ns3-bake-hg/    bake
        ln -sf ../pybindgen-git/  pybindgen
        echo "Update the .config file ... pwd=`pwd`"
        PYTHON=`which python2` ./download.py
    fi

    echo "compile openflow lib support ..."
    cd $srcdir/ns3-openflow-hg
    grep -rl '/usr/bin/env python' . \
        | xargs sed -e 's|/usr/bin/env python$|/usr/bin/env python2|g' -i
    echo "  waf configure ..."
    PYTHON=`which python2` ./waf configure
    echo "  waf build ..."
    PYTHON=`which python2` ./waf build


    echo "compile pybindgen lib support ..."
    #cd $srcdir/pybindgen-git
    sed -e 's|#!/usr/bin/env python$|#!/usr/bin/env python2|g' -i ${srcdir}/pybindgen-git/waf
    cd $srcdir/ns3-hg/pybindgen
    grep -rl '/usr/bin/env python' . \
        | xargs sed -e 's|/usr/bin/env python$|/usr/bin/env python2|g' -i
    echo "  waf configure ..."
    PYTHON=`which python2` ./waf configure
    echo "  waf build ..."
    PYTHON=`which python2` ./waf build


    echo "compile click support ..."
    cd $srcdir/ns3-click-git
    #autoreconf -if
    ./configure --disable-linuxmodule --enable-nsclick --enable-wifi
    rm -rf bin
    make -j $(nproc)

    echo "compile BRITE ..."
    cd $srcdir/ns3-brite-hg
    make -j $(nproc)


    if [ 1 = 1 ]; then

    echo "compile Network Simulation Cradle (NSC) ..."
    cd $srcdir/ns3-nsc-hg

    echo "(NSC) replace python2 ..."
    grep -rl '/usr/bin/env python' . \
        | while read A; do sed -e 's|/usr/bin/env python$|/usr/bin/python2|g' -i $A; done
    echo "(NSC) replace flex ..."
    sed -e "s|if not conf.CheckLib('fl') or not exe_exists('flex'):|if not conf.CheckLib('fl') and not exe_exists('flex'):|g" -i SConstruct
    sed -e "s|SConscript('test/SConscript')||g" -i SConstruct
    echo "(NSC) replace is_function ..."
    grep -Hr "is_function(" . | awk -F: '{print $1}' | sort | uniq \
      | while read A; do sed -e 's|is_function(|is_funct(|g' -i $A; done
    echo "(NSC) replace is_enum ..."
    grep -Hr "is_enum(" . | awk -F: '{print $1}' | sort | uniq \
      | while read A; do sed -e 's|is_enum(|is_enumeration(|g' -i $A; done

    echo "(NSC) replace yylex ..."
    grep -Hr "extern int yylex" . | awk -F: '{print $1}' | sort | uniq \
      | while read A; do sed -e 's|extern int yylex();||g' -i $A; done
    sed -e 's|class node_t;|class node_t; extern "C" int yylex();|g' -i globaliser/handle_global.h
    sed -e 's|#include "parser.tab.hh"|#include "parser.tab.hh"\n#include "handle_global.h"\n|g' -i globaliser/ilex.cc

    echo "(NSC) scons ..."
    #python2 scons.py
    PYTHON=`which python2` SHLIBSUFFIX=.so ./scons.py

    fi
}

build()
{
    if [ ! "${USE_DEV}" = "0" ]; then
        cd "${srcdir}/${pkgname}"
    else
        cd $srcdir/ns-allinone-$pkgver
    fi

    echo "Build ns-3 with build.py ..."
    PYTHON=`which python2` ./build.py \
        --build-options=--progress \
        --qmake-path=/usr/bin/qmake-qt4 \
        -- \
        -d release -o build-shared \
        --prefix=/usr \
        --libdir=/usr/lib \
        --with-python=`which python2` \
        --progress \
        --enable-mpi \
        --enable-sudo \
        --with-nsclick=$srcdir/ns3-click-git \
        --with-openflow=$srcdir/ns3-openflow-hg \
        --with-brite=$srcdir/ns3-brite-hg \
        --with-pybindgen=$srcdir/pybindgen-git \
        --with-nsc=$srcdir/ns3-nsc-hg \
        #--enable-examples \
        #--enable-tests \
        #$(NULL)
}

build1()
{
    if [ ! "${USE_DEV}" = "0" ]; then
        cd "${srcdir}/${pkgname}/ns-3-dev"
    else
        cd $srcdir/ns-allinone-$pkgver/ns-$pkgver
    fi
    echo "Build ns-3 with waf ..."
    PYTHON=`which python2` ./waf configure \
        -d release -o build-shared \
        --prefix=/usr \
        --libdir=/usr/lib \
        --with-python=`which python2` \
        --progress \
        --enable-mpi \
        --enable-sudo \
        --with-nsclick=$srcdir/ns3-click-git \
        --with-openflow=$srcdir/ns3-openflow-hg \
        --with-brite=$srcdir/ns3-brite-hg \
        --with-pybindgen=$srcdir/pybindgen-git \
        --with-nsc=$srcdir/ns3-nsc-hg \
        #--enable-examples \
        #--enable-tests \
        #$(NULL)
    PYTHON=`which python2` ./waf build
}

verify_build()
{
    if [ ! "${USE_DEV}" = "0" ]; then
        cd "${srcdir}/${pkgname}/ns-3-dev"
    else
        cd $srcdir/ns-allinone-$pkgver/ns-$pkgver
    fi

    # openflow
    # https://www.nsnam.org/docs/release/3.13/models/html/openflow-switch.html
    PYTHON=`which python2` ./waf --run openflow-switch
    PYTHON=`which python2` ./waf --run "openflow-switch -v"

    # NS-3 Click Integration Support
    # https://www.nsnam.org/docs/models/html/click.html
    PYTHON=`which python2` ./waf --run nsclick-simple-lan

    # brite
    # https://www.nsnam.org/wiki/BRITE_integration_with_ns-3
    PYTHON=`which python2` ./waf --run 'brite-generic-example --verbose=1'

    # nsc
    # https://www.nsnam.org/docs/models/html/tcp.html?#network-simulation-cradle
    PYTHON=`which python2` ./test.py -s ns3-tcp-interoperability
}

package()
{
    if [ ! "${USE_DEV}" = "0" ]; then
        cd "${srcdir}/${pkgname}/ns-3-dev"
    else
        cd $srcdir/ns-allinone-$pkgver/ns-$pkgver
    fi
    PYTHON=`which python2` ./waf install \
        --with-python=`which python2` \
        --destdir=$pkgdir/
}

#sha1sums=('59a9a3cfd738c48e17253eb7ed2aaccfc1cc498d' 'SKIP' 'SKIP' 'SKIP')
md5sums=('SKIP' #c1580dbd9bd1f65b3453cd8956d36ae7
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
    )

