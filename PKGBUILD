# Maintainer: Kuan-Yen Chou <kychou2 at illinois dot edu>
# Contributor: Yunhui Fu <yhfudev@gmail.com>

pkgname=ns3
pkgver=3.35
pkgrel=2
pkgdesc='Discrete-event network simulator for Internet systems'
arch=('any')
url='http://www.nsnam.org/'
license=('GPL2')
depends=('gcc' 'python' 'dpdk'
         'qt5-base'                         # netanim animator
         'openmpi'                          # MPI for HPC
         'sqlite'                           # database support for statistics
         'libxml2'                          # config store
         'boost' 'boost-libs'               # openflow switch
         'glibc' 'libpcap'                  # click
         'gsl'                              # wireless model fidelity
         'gtk2'                             # configuration system
         # ns-3-pyviz
         'python-pygraphviz' 'goocanvas' 'pygoocanvas' 'pygtk'
         # Python bindings auto-generation
         'cmake' 'clang' 'llvm' 'castxml' 'pygccxml' 'python-cxxfilt')
makedepends=('python-pip' 'python-setuptools' 'python-wheel' 'git' 'mercurial'
             'bzr' 'doxygen' 'graphviz' 'imagemagick')
optdepends=('python-sphinx: ns3 manual and tutorial'
            'dia: ns3 manual and tutorial'
            'texlive-bin: ns3 manual and tutorial'
            'uncrustify: utils/check-style.py style check program')
provides=('ns3')
conflicts=('ns3-hg')
source=("https://www.nsnam.org/release/ns-allinone-$pkgver.tar.bz2"
        "ns3-brite-hg::hg+https://code.nsnam.org/jpelkey3/BRITE"
        "click-git::git+https://github.com/kohler/click"
        "ns3-openflow-hg::hg+https://code.nsnam.org/openflow"
        "pybindgen-git::git+https://github.com/gjcarneiro/pybindgen")
sha256sums=('25e07a95349847b3e453d3af29a94545a4f869b1c6b4d860900cb7718fb1a618'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd "$srcdir/ns-allinone-$pkgver/ns-$pkgver"
    sed -i -e 's/CALL_MASTER/CALL_MAIN/' "src/fd-net-device/model/dpdk-net-device.cc"
}

build() {
    # Build brite
    cd "$srcdir/ns3-brite-hg"
    make

    # Build click
    cd "$srcdir/click-git"
    sed -i -e '/linux_true/d' include/click/cxxprotect.h # https://github.com/kohler/click/issues/493
    ./configure --prefix=/usr --disable-linuxmodule --enable-nsclick --enable-wifi
    rm -rf bin
    make

    # Build openflow
    cd "$srcdir/ns3-openflow-hg"
    ./waf configure --prefix=/usr
    ./waf build --progress

    # Build pybindgen
    cd "$srcdir/pybindgen-git"
    ./waf configure --prefix=/usr --build-profile=release
    ./waf build --progress

    # Build netanim
    cd "$srcdir/ns-allinone-$pkgver/netanim"-*
    qmake NetAnim.pro
    make

    # Build ns3
    cd "$srcdir/ns-allinone-$pkgver/ns-$pkgver"
    ./waf configure \
        --build-profile=release \
        --prefix=/usr \
        --progress \
        --enable-sudo \
        --enable-tests \
        --enable-examples \
        --enable-mpi \
        --enable-des-metrics \
        --force-planetlab \
        --with-brite="$srcdir/ns3-brite-hg" \
        --with-nsclick="$srcdir/click-git" \
        --with-openflow="$srcdir/ns3-openflow-hg" \
        --with-pybindgen="$srcdir/pybindgen-git"
    ./waf build --progress

    # replace directory path
    find -L . -name "*.pc" | xargs -n 1 sed -e "s|[^[:blank:]\r\n]\+$srcdir[^[:blank:]\r\n]\+||g" -i
}

# Disabled for now due to gsl version mismatch
#check() {
#    cd "$srcdir/ns-allinone-$pkgver/ns-$pkgver"
#
#    # brite
#    # https://www.nsnam.org/docs/models/html/brite.html
#    ./waf --run brite-generic-example
#    mpirun -np 2 ./waf --run brite-MPI-example
#
#    # openflow
#    # https://www.nsnam.org/docs/models/html/openflow-switch.html
#    ./waf --run "openflow-switch -v"
#
#    # click
#    # https://www.nsnam.org/docs/models/html/click.html
#    ./waf --run nsclick-simple-lan
#
#    # ns3
#    ./test.py
#}

package() {
    cd "$srcdir/ns-allinone-$pkgver/ns-$pkgver"
    ./waf install --prefix=/usr --destdir="$pkgdir"

    cd "$srcdir/ns-allinone-$pkgver/netanim"-*
    install -Dm 755 ./NetAnim "${pkgdir}/usr/bin/netanim"
}

# vim: set ts=4 sw=4 et :
