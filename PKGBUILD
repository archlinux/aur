# Maintainer: Yunhui Fu <yhfudev@gmail.com>

USE_DEV=0
VER_RELEASE=3.28

pkgname=ns3-hg
pkgver=r13737
pkgrel=1

if [ "${USE_DEV}" = "0" ]; then
pkgname=ns3
pkgver=${VER_RELEASE}
fi

pkgdesc='Full package for the ns3 -- a Discrete-event network simulator for Internet systems'
arch=( 'i686' 'x86_64' 'armv6' 'armv6h' 'arm7h' )
url='http://www.nsnam.org/'
license=('GPL')
depends=(
    'gsl' # GNU Scientific Library
    'libxml2' 'sqlite' 'boost' 'boost-libs'
    'doxygen'
    'graphviz' 'imagemagick' 'dia' 'qt4'
    'python2' 'python2-setuptools' 'python2-pydot' 'goocanvas' 'pygoocanvas' 'pygtk' 'python2-pygraphviz'
    'pygccxml' 'castxml'
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
conflicts=('ns3' 'ns-3' 'ns3-full' 'ns3-hg')
source=(
    "https://www.nsnam.org/release/ns-allinone-${VER_RELEASE}.tar.bz2"
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
    if [ ! "${USE_DEV}" = "0" ]; then
        pkgver_hg
    else
        echo $pkgver
    fi
}

prepare()
{
    local DN_PYBINDGEN="$srcdir/pybindgen-git"
    local DN_NETANIM="$srcdir/ns3-netanim-hg"
    if [ "${USE_DEV}" = "0" ]; then
        cd "$srcdir/ns-allinone-$pkgver/"
        local FN=`ls | grep pybindgen`
        DN_PYBINDGEN="$srcdir/ns-allinone-$pkgver/$FN"
        FN=`ls | grep netanim`
        DN_NETANIM="$srcdir/ns-allinone-$pkgver/$FN"
    fi

    if [ "${USE_DEV}" = "0" ]; then
        # already include source for netanim, pybindgen, and ns3-xxx
        cd $srcdir/ns-allinone-$pkgver

        sed '1s|^|#!/usr/bin/env python2\n|' -i ns-$pkgver/bindings/python/wscript
        sed -e 's|#!/usr/bin/env python$|#!/usr/bin/env python2|g' -i ns-$pkgver/waf
    else
        # setup: bake, netanim, pybindgen, and ns-3-dev
        cd "${srcdir}/${pkgname}"

        sed '1s|^|#!/usr/bin/env python2\n|' -i ${srcdir}/ns3-dev-hg/bindings/python/wscript
        sed -e 's|#!/usr/bin/env python$|#!/usr/bin/env python2|g' -i ${srcdir}/ns3-dev-hg/waf
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
    cd "${DN_PYBINDGEN}"
    sed -e 's|#!/usr/bin/env python$|#!/usr/bin/env python2|g' -i waf
    grep -rl '/usr/bin/env python' . \
        | xargs sed -e 's|/usr/bin/env python$|/usr/bin/env python2|g' -i
    #echo "  waf configure ..."
    #PYTHON=`which python2` ./waf configure
    #echo "  waf build ..."
    #PYTHON=`which python2` ./waf build

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
    PYTHON=`which python2` SHLIBSUFFIX=.so ./scons.py -j $(nproc)

    fi
}

build0()
{
    local DN_PYBINDGEN="$srcdir/pybindgen-git"
    if [ "${USE_DEV}" = "0" ]; then
        cd "$srcdir/ns-allinone-$pkgver/"
        local FN=`ls | grep pybindgen`
        DN_PYBINDGEN="$srcdir/ns-allinone-$pkgver/$FN"
    fi

    if [ "${USE_DEV}" = "0" ]; then
        cd $srcdir/ns-allinone-$pkgver
    else
        cd "${srcdir}/${pkgname}"
    fi

    echo "Build ns-3 with build.py ..."
    PYTHON=`which python2` ./build.py \
        --build-options="--progress -j $(nproc)" \
        --qmake-path=/usr/bin/qmake-qt4 \
        -- \
        -d release -o build-shared \
        --prefix=/usr \
        --libdir=/usr/lib \
        --with-python=`which python2` \
        --progress \
        --enable-mpi \
        --enable-sudo \
        --enable-des-metrics \
        --force-planetlab \
        --with-nsclick=$srcdir/ns3-click-git \
        --with-openflow=$srcdir/ns3-openflow-hg \
        --with-brite=$srcdir/ns3-brite-hg \
        --with-nsc=$srcdir/ns3-nsc-hg \
        "--with-pybindgen=${DN_PYBINDGEN}" \
        --enable-examples \
        --enable-tests \
        $(NULL)

    # replace directory path
    find -L . -name "*.pc" | xargs -n 1 sed -e "s|[^[:blank:]\r\n]\+$srcdir[^[:blank:]\r\n]\+||g" -i
}

build1()
{
    local DN_PYBINDGEN="$srcdir/pybindgen-git"
    if [ "${USE_DEV}" = "0" ]; then
        cd "$srcdir/ns-allinone-$pkgver/"
        local FN=`ls | grep pybindgen`
        DN_PYBINDGEN="$srcdir/ns-allinone-$pkgver/$FN"
    fi

    if [ "${USE_DEV}" = "0" ]; then
        cd $srcdir/ns-allinone-$pkgver/ns-$pkgver
    else
        cd "${srcdir}/${pkgname}/ns-3-dev"
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
        --enable-des-metrics \
        --force-planetlab \
        --with-nsclick=$srcdir/ns3-click-git \
        --with-openflow=$srcdir/ns3-openflow-hg \
        --with-brite=$srcdir/ns3-brite-hg \
        --with-nsc=$srcdir/ns3-nsc-hg \
        "--with-pybindgen=${DN_PYBINDGEN}" \
        --enable-examples \
        --enable-tests \
        $(NULL)
    PYTHON=`which python2` ./waf build --progress -j $(nproc)
    # replace directory path
    find -L . -name "*.pc" | xargs -n 1 sed -e "s|[^[:blank:]\r\n]\+$srcdir[^[:blank:]\r\n]\+||g" -i


    local DN_NETANIM="$srcdir/ns3-netanim-hg"
    if [ "${USE_DEV}" = "0" ]; then
        cd "$srcdir/ns-allinone-$pkgver/"
        FN=`ls | grep netanim`
        DN_NETANIM="$srcdir/ns-allinone-$pkgver/$FN"
    fi
    cd "${DN_NETANIM}"
    qmake-qt4 NetAnim.pro
    make -j 8
}

build() {
  build1 # replace this
}

verify_build()
{

    LIBVER="3-dev"
    if [ "${USE_DEV}" = "0" ]; then
        LIBVER="${pkgver}"
    fi

    if [ "${USE_DEV}" = "0" ]; then
        cd $srcdir/ns-allinone-$pkgver/ns-$pkgver
    else
        cd "${srcdir}/${pkgname}/ns-3-dev"
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

    g++ -std=c++11 \
      `pkg-config --cflags libns${LIBVER}-applications libns${LIBVER}-point-to-point` \
      `pkg-config --libs   libns${LIBVER}-applications libns${LIBVER}-point-to-point` \
      -o ns3-first examples/tutorial/first.cc
}

package()
{
    if [ "${USE_DEV}" = "0" ]; then
        cd $srcdir/ns-allinone-$pkgver/ns-$pkgver
    else
        cd "${srcdir}/${pkgname}/ns-3-dev"
    fi
    PYTHON=`which python2` ./waf install \
        --with-python=`which python2` \
        --destdir=$pkgdir/

    local LIBVER="3-dev"
    if [ "${USE_DEV}" = "0" ]; then
        LIBVER="${pkgver}"
    fi
    local DN_NETANIM="$srcdir/ns3-netanim-hg"
    if [ "${USE_DEV}" = "0" ]; then
        cd "$srcdir/ns-allinone-$pkgver/"
        FN=`ls | grep netanim`
        DN_NETANIM="$srcdir/ns-allinone-$pkgver/$FN"
    fi

    install -Dm755 "${DN_NETANIM}/NetAnim" ${pkgdir}/usr/bin/ns${LIBVER}-netanim
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
         'SKIP'
    )

