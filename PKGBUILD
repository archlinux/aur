# Maintainer: Kuan-Yen Chou <kychou2 at illinois dot edu>
# Contributor: Yunhui Fu <yhfudev@gmail.com>

pkgname=ns3
pkgver=3.39
pkgrel=1
pkgdesc='Discrete-event network simulator for Internet systems'
arch=('any')
url='http://www.nsnam.org/'
license=('GPL2')
depends=('python' 'dpdk'
         'qt5-base'           # netanim animator
         'openmpi'            # MPI for HPC
         'sqlite'             # database support for statistics
         'libxml2'            # config store
         'boost' 'boost-libs' # openflow switch
         'glibc' 'libpcap'    # click
         'gsl'                # wireless model fidelity
         'gtk3'               # configuration system
         # ns-3-pyviz
         'goocanvas' 'python-gobject' 'python-cairo' 'python-pygraphviz' 'ipython'
         # Python bindings auto-generation
         'clang' 'llvm' 'castxml' 'python-pygccxml' 'python-cxxfilt')
makedepends=('cmake' 'python-setuptools' 'python-pip' 'python-wheel' 'git'
             'mercurial'
             # documentation
             'doxygen' 'graphviz' 'imagemagick' 'python-sphinx' 'texlive-bin')
optdepends=('uncrustify: utils/check-style.py style check program'
            'dia: documentation diagrams')
provides=('ns3' 'clickrouter')
conflicts=('ns3-hg')
source=("https://www.nsnam.org/releases/ns-allinone-$pkgver.tar.bz2"
        "brite-hg::hg+https://code.nsnam.org/BRITE"
        "click-git::git+https://github.com/kohler/click"
        "openflow-hg::hg+https://code.nsnam.org/openflow"
        "pybindgen-git::git+https://github.com/gjcarneiro/pybindgen")
sha256sums=('bbddebac2b035a8bd7c2ff934b3c4d9735ef9cf6763e362b79a62e0da8915eb0'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd "$srcdir/ns-allinone-$pkgver/ns-$pkgver"
    sed -i "src/fd-net-device/model/dpdk-net-device.cc" \
        -e 's/CALL_MASTER/CALL_MAIN/' \
        -e 's/ETH_LINK_DOWN/RTE_ETH_LINK_DOWN/' \
        -e 's/ETH_MQ_TX_NONE/RTE_ETH_MQ_TX_NONE/' \
        -e 's/DEV_TX_OFFLOAD_MBUF_FAST_FREE/RTE_ETH_TX_OFFLOAD_MBUF_FAST_FREE/' \
        -e '/split_hdr_size/d'
}

build() {
    # brite
    # https://www.nsnam.org/docs/models/html/brite.html
    cd "$srcdir/brite-hg"
    make

    # click
    # https://www.nsnam.org/docs/models/html/click.html
    cd "$srcdir/click-git"
    sed -i -e '/linux_true/d' include/click/cxxprotect.h # https://github.com/kohler/click/issues/493
    ./configure --prefix="$srcdir/click-git/install" \
        --disable-linuxmodule \
        --enable-nsclick \
        --enable-wifi
    make
    make install

    # openflow
    # https://www.nsnam.org/docs/models/html/openflow-switch.html
    cd "$srcdir/openflow-hg"
    ./waf configure --prefix=/usr
    ./waf build

    # pybindgen
    cd "$srcdir/pybindgen-git"
    ./waf configure --prefix=/usr --build-profile=release
    ./waf build

    # netanim
    cd "$srcdir/ns-allinone-$pkgver/netanim"-*
    qmake NetAnim.pro
    make

    # ns3
    cd "$srcdir/ns-allinone-$pkgver/ns-$pkgver"
    ./ns3 configure \
        --build-profile=default \
        --prefix=/usr \
        --enable-logs \
        --enable-dpdk \
        --enable-examples \
        --enable-gsl \
        --enable-gtk \
        --enable-mpi \
        --enable-python-bindings \
        --enable-tests \
        --with-brite="$srcdir/brite-hg" \
        --with-click="$srcdir/click-git/install" \
        --with-openflow="$srcdir/openflow-hg"
    ./ns3 build

    # replace directory path
    find -L . -name '*.pc' -exec \
        sed -e "s,[^[:blank:]]\+${srcdir}[^[:blank:]]\+,,g" -i {} +
}

#check() {
#    cd "$srcdir/ns-allinone-$pkgver/ns-$pkgver"
#
#    # brite
#    ./ns3 --run brite-generic-example
#    mpirun -np 2 ./ns3 --run brite-MPI-example
#
#    # click
#    ./ns3 --run nsclick-simple-lan
#
#    # openflow
#    ./ns3 --run "openflow-switch -v"
#
#    # ns3
#    ./test.py
#}

package() {
    # brite
    cd "$srcdir/brite-hg"
    PREFIX="$pkgdir/usr" make install

    # click
    cd "$srcdir/click-git"
    cp -rf ./install/* "$pkgdir/usr"

    # openflow
    cd "$srcdir/openflow-hg"
    ./waf install --destdir="$pkgdir"
    # conflicts with openvswitch
    rm -rf "$pkgdir/usr/include/openflow"

    # pybindgen
    cd "$srcdir/pybindgen-git"
    ./waf install --destdir="$pkgdir"

    # netanim
    cd "$srcdir/ns-allinone-$pkgver/netanim"-*
    install -Dm 755 ./NetAnim "$pkgdir/usr/bin/netanim"

    # ns3
    cd "$srcdir/ns-allinone-$pkgver/ns-$pkgver"
    DESTDIR="$pkgdir" ./ns3 install

    mapfile -t FILES < <(grep -r "$srcdir" "$pkgdir" 2>&1 |
        grep -v 'binary file matches' |
        cut -d: -f1 |
        sort -u)
    sed -i \
        -e "s,$srcdir/brite-hg,/usr/lib,g" \
        -e "s,$srcdir/click-git/install,/usr,g" \
        -e "s,$srcdir/click-git,,g" \
        -e "s,$srcdir/openflow-hg/build,/usr/lib,g" \
        -e "s,$srcdir/openflow-hg,/usr,g" \
        -e "s,;$srcdir,,g" \
        -e "s,-I$srcdir,,g" \
        "${FILES[@]}"
}

# vim: set ts=4 sw=4 et :
