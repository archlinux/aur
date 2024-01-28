# Maintainer: Kuan-Yen Chou <kychou2 at illinois dot edu>
# Contributor: Yunhui Fu <yhfudev@gmail.com>

_cppyy_ver=2.4.2
_cppyy_backend_ver=1.14.10
_cppyy_cling_ver=6.27.1
_cpycppyy_ver=1.12.12

pkgname=ns3
pkgver=3.40
pkgrel=2
pkgdesc='Discrete-event network simulator for Internet systems'
arch=('any')
url='http://www.nsnam.org/'
license=('GPL2')
depends=('python' 'dpdk'
         'sqlite'             # database support for statistics
         'qt5-base'           # netanim animator
         'openmpi'            # MPI for HPC
         'eigen'              # more efficient calculations when using the 3GPP
                              # propagation loss models in LTE and NR
                              # simulations
         'gsl'                # more accurate 802.11b (legacy) WiFi error models
         'libxml2'            # XML-based config store
         'gtk3'               # configuration system
         'boost' 'boost-libs' # openflow switch support
         'glibc' 'libpcap'    # click
         # VMs and tap bridge
         'lxc' 'vtun' 'ebtables' 'bridge-utils' # uml-utilities
         # ns-3-pyviz
         'goocanvas' 'python-gobject' 'python-cairo' 'python-pygraphviz'
         'ipython')
makedepends=('cmake' 'python-build' 'python-installer' 'python-wheel'
             'python-pip' 'git' 'mercurial'
             # documentation
             'doxygen' 'graphviz' 'imagemagick' 'python-sphinx' 'texlive-bin')
optdepends=('uncrustify: utils/check-style.py style check program'
            'dia: documentation diagrams')
provides=('ns3' 'clickrouter' "cppyy=$_cppyy_ver")
conflicts=('ns3-hg')
source=("https://www.nsnam.org/releases/ns-allinone-$pkgver.tar.bz2"
        "https://files.pythonhosted.org/packages/source/c/cppyy/cppyy-$_cppyy_ver.tar.gz"
        "https://files.pythonhosted.org/packages/source/c/cppyy-backend/cppyy-backend-$_cppyy_backend_ver.tar.gz"
        "https://files.pythonhosted.org/packages/source/C/CPyCppyy/CPyCppyy-$_cpycppyy_ver.tar.gz"
        "ns3-scratch-nested-subdir.patch"
        "cppyy-cling-6.27.1.patch"
        "brite.tar.gz::https://code.nsnam.org/BRITE/archive/tip.tar.gz"
        "openflow.tar.gz::https://code.nsnam.org/openflow/archive/tip.tar.gz"
        "click-git::git+https://github.com/kohler/click")
sha256sums=('c0ba395b6fcb084c4d43d6117b28932f716b26aebb54498ce2f44c0c39be3e60'
            '468a8877afe724b9bf5e83704513d64be9cf2f91183c83704d3e2118626012d3'
            '51ac01c4cca28ef54544ce0b41355d885242f1a0178619bea071f5c43fd03dac'
            '19188585eda3538eb69d32fd3fa9db0cc85a6031b6ca6955efff8051b798a73e'
            '20daecc727ac793732be25d5a2977f72c8edaa5c01720d5999069936cfe9d292'
            '2577f9db94474acf3f804cc9c38f1dfe8367e0e4a35888cb09407d40d372727f'
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
    patch -Np1 -i "$srcdir/ns3-scratch-nested-subdir.patch"

    # https://github.com/kohler/click/issues/493
    cd "$srcdir/click-git"
    sed -i -e '/linux_true/d' include/click/cxxprotect.h
}

build() {
    # brite
    # https://www.nsnam.org/docs/models/html/brite.html
    brite_dir="$(realpath "$srcdir"/BRITE-*)"
    cd "$brite_dir"
    make

    # click
    # https://www.nsnam.org/docs/models/html/click.html
    cd "$srcdir/click-git"
    ./configure --prefix="$srcdir/click-git/install" \
        --disable-linuxmodule \
        --enable-nsclick \
        --enable-wifi
    make
    make install

    # openflow
    # https://www.nsnam.org/docs/models/html/openflow-switch.html
    openflow_dir="$(realpath "$srcdir"/openflow-*)"
    cd "$openflow_dir"
    ./waf configure --prefix=/usr
    ./waf build

    # python virtualenv for cppyy
    venv_dir="$srcdir/.venv"
    python -m venv --system-site-packages "$venv_dir"
    # shellcheck source=/dev/null
    source "$venv_dir/bin/activate"

    # cppyy-cling (from pip)
    python -m pip install cppyy-cling==$_cppyy_cling_ver
    # patch cppyy-cling 6.27.1
    pylib_dir="$(realpath "$venv_dir"/lib/python*/site-packages)"
    patch -d "$pylib_dir" -Np1 -i "$srcdir/cppyy-cling-6.27.1.patch"

    # cppyy-backend
    cd "$srcdir/cppyy-backend-$_cppyy_backend_ver"
    python -m build --wheel --no-isolation
    python -m installer --prefix="$venv_dir" --compile-bytecode=1 dist/*.whl

    # CPyCppyy
    cd "$srcdir/CPyCppyy-$_cpycppyy_ver"
    python -m build --wheel --no-isolation
    python -m installer --prefix="$venv_dir" dist/*.whl

    # cppyy
    cd "$srcdir/cppyy-$_cppyy_ver"
    python -m build --wheel --no-isolation
    python -m installer --prefix="$venv_dir" dist/*.whl

    # netanim
    cd "$srcdir/ns-allinone-$pkgver/netanim"-*
    qmake NetAnim.pro
    make

    # ns3
    cd "$srcdir/ns-allinone-$pkgver/ns-$pkgver"
    ./ns3 configure \
        --build-profile=default \
        --enable-build-version \
        --enable-dpdk \
        --enable-eigen \
        --enable-examples \
        --enable-gsl \
        --enable-gtk \
        --enable-logs \
        --enable-monolib \
        --enable-mpi \
        --enable-python-bindings \
        --enable-tests \
        --with-brite="$brite_dir" \
        --with-click="$srcdir/click-git/install" \
        --with-openflow="$openflow_dir" \
        --prefix=/usr
    ./ns3 build

    # deactivate python virtualenv
    deactivate

    # replace directory path
    find -L . -name '*.pc' -exec \
        sed -e "s,[^[:blank:]]\+${srcdir}[^[:blank:]]\+,,g" -i {} +
}

check() {
   cd "$srcdir/ns-allinone-$pkgver/ns-$pkgver"

   # brite
   ./ns3 run brite-generic-example
   mpirun -np 2 ./ns3 run brite-MPI-example

   # click
   ./ns3 run nsclick-simple-lan

   # openflow
   ./ns3 run "openflow-switch -v"

   # ns3
   # ./test.py
}

package() {
    # brite
    brite_dir="$(realpath "$srcdir"/BRITE-*)"
    cd "$brite_dir"
    PREFIX="$pkgdir/usr" make install

    # click
    cd "$srcdir/click-git"
    cp -rf ./install/* "$pkgdir/usr"

    # openflow
    openflow_dir="$(realpath "$srcdir"/openflow-*)"
    cd "$openflow_dir"
    ./waf install --destdir="$pkgdir"
    # conflicts with openvswitch
    rm -rf "$pkgdir/usr/include/openflow"

    # cppyy
    venv_dir="$srcdir/.venv"
    mkdir -p "$pkgdir/usr/include" "$pkgdir/usr/lib"
    cp -rf "$venv_dir"/include/* "$pkgdir/usr/include/"
    cp -rf "$venv_dir"/lib/* "$pkgdir/usr/lib/"
    rm -rf "$pkgdir"/usr/lib/python*/site-packages/*distutil*
    rm -rf "$pkgdir"/usr/lib/python*/site-packages/*pip*
    rm -rf "$pkgdir"/usr/lib/python*/site-packages/*setuptools*
    rm -rf "$pkgdir"/usr/lib/python*/site-packages/pkg_resources

    # netanim
    cd "$srcdir/ns-allinone-$pkgver/netanim"-*
    install -Dm755 ./NetAnim "$pkgdir/usr/bin/netanim"

    # ns3
    cd "$srcdir/ns-allinone-$pkgver/ns-$pkgver"
    DESTDIR="$pkgdir" ./ns3 install

    mapfile -t FILES < <(grep -r "$srcdir" "$pkgdir" 2>&1 |
        grep -v 'binary file matches' |
        cut -d: -f1 |
        sort -u)
    sed -i \
        -e "s,$srcdir/$(basename "$brite_dir"),/usr/lib,g" \
        -e "s,$srcdir/click-git/install,/usr,g" \
        -e "s,$srcdir/click-git,,g" \
        -e "s,$srcdir/$(basename "$openflow_dir")/build,/usr/lib,g" \
        -e "s,$srcdir/$(basename "$openflow_dir"),/usr,g" \
        -e "s,;$srcdir,,g" \
        -e "s,-I$srcdir,,g" \
        "${FILES[@]}"
}

# vim: set ts=4 sw=4 et :
