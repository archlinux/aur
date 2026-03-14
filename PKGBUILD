# Maintainer:  SpacingBat3 <spacingbat3+aur@gmail.com>
# Contributor: Kuan-Yen Chou <kychou2 at illinois dot edu>
# Contributor: Yunhui Fu <yhfudev@gmail.com>

pkgbase=ns3
pkgname=(ns3 python-ns3 ns3-examples{,-src}) #FIXME: ns3-docs (Doxygen is damn large!)
pkgver=3.47
pkgrel=3
pkgdesc='Discrete-event network simulator for Internet systems'
arch=('x86_64')
url='https://www.nsnam.org/'
license=('GPL-2.0-only')
makedepends=(
    ### Required, according to docs
    python gcc cmake ninja git
    ### Optional, seems to be build deps
    # Openflow (devel) [FIXME!]
    # boost
    # Eigen3 (vector math lib, header-only)
    eigen3
    # Sphinx documentation
    # TODO!
)
conflicts=()
source=(
    "https://www.nsnam.org/releases/ns-${pkgver}.tar.bz2"
    0001-fix-newer-dpdk-versions.patch
)

sha256sums=('8b3adca956c834ea436b915986ab8fd053e90041acae7426895d595aaa3ccc39'
            '9f519502828ffb403948d2601eb36e807e92d21793e985f63c90150de62626e5')
sha512sums=('41a060b93e88bc389ef1f316b8e4568be2ca559f6a2e4b54bca29b6620e9fbb78e2ed0eec4c8b3b119f071aad43dfa09edbd2bf78ea125744a44f2366724d50c'
            '91d0f73f65053384c23f3c59d38bd8a988ba5ada97b62919b50e74daccb89cbc32bb32b7b1f84bb5426158325353fac306a5edcdce0690359fdaa82b0421679a')
b2sums=('c03622d72afc5043aced4aa8ee39b477a15feb28e45142c6d4117a4ffd94c146d522200ac829831b1e9e89bb8bcd17f2f9e66306ba1a6bae9300b68025648f85'
        '83fbc3bb43094ee08bee4741c8d343de8a3b84a1b3f151d311586b3d3adf3b35142ca6295c7d15901514cafc891a51432e1a5188bef6491465984f587d531edc')

_pver() {
    python --version | awk '{print $2}' | sed 's/.[^.]*$//'
}

_pver_next() {
    _pver | sed "s/\.[^.]*$/\.$(($(python --version | awk '{print $2}' | sed 's/^[^.]*\.\([^.]*\)\.[^.]*$/\1/')+1))/"
}

prepare() {
    cd "${srcdir}/ns-${pkgver}"
    for patch in "${source[@]}"; do if [ "${patch##*.}" == "patch" ]; then
        patch -Np1 -i "$srcdir/$patch"
    fi; done
}

# This is taken from mesa package
_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv -v "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

build() {
    cd "${srcdir}/ns-${pkgver}"
    ./ns3 configure \
        --build-profile=default \
        --enable-build-version \
        --enable-dpdk \
        --enable-eigen \
        --enable-examples \
        --enable-tests \
        --enable-gsl \
        --enable-gtk \
        --enable-logs \
        --enable-monolib \
        --enable-python-bindings \
        --prefix=/usr \
        -- \
        -DNS3_BINDINGS_INSTALL_DIR="/usr/lib/python$(_pver)/site-packages" \
        -DCMAKE_INSTALL_LIBEXECDIR="lib/$pkgname/"
        # FIXME!:
        #--with-click="$srcdir/click-git/install" \
        #--with-openflow="$openflow_dir" \
        # Disabled:
        #--enable-mpi \ # Incompatible with Python bindings
                        # (I assume Python is better for consumer-grade
                        # hardware or development on NS-3)
    ./ns3 build
    # Build docs (if enabled)
    for has_docs in "${pkgname[@]}"; do if [ "$has_docs" == "ns3-docs" ]; then
        ./ns3 docs doxygen-no-build
        break
    fi; done;
}

# FIXME: add tests
# (not the most important thing, but still)
#check() {}

package_ns3() {
    depends=(
        ### Optional (most likely needed after/during compiling, allow more features)
        # 1. Database support
        sqlite3
        # 2. GNU Scientific Library
        gsl
        # 3. XML config store
        libxml2
        # 4. GTK configuration store
        gtk3
        # 5. Openflow [FIXME]
        # openflow boost-libs
        # 6. Brite
        brite
        # 7. Click [FIXME]
        # clickrouter
        # 8. DPDK
        dpdk
        # 9. Netmap emulation FdNetDevice
        # netmap # NEEDS AUR PACKAGE FIX FOR CUSTOM KERNELS!
        # 10. MPI (distributed computing) support
        ### disabled due to conflicts with python bindings
        ### (possible future FIXME? compile twice and
        ### package-level conflicts?)
        #openmpi
    )
    optdepends=(
        # PCAP readers
        {tcpdump,wireshark-{cli,qt}}': PCAP file reader'
        # Virtual machines
        {lxc,iproute2,iptables}': virtual machines in network'
        # Recommend Python bindings
        'python-ns3: Python bindings (broken)'
        # Recommend Network animator
        'netanim: Animator for XML simulation data'
    )
    cd "${srcdir}/ns-${pkgver}"
    DESTDIR="$pkgdir" ./ns3 install
    cd "$pkgdir"

    # Python bindings
    _pick python usr/lib/python$(_pver)
}

package_ns3-examples() {
    pkgdesc+=" (prebuilt example applications)"
    optdepends=('ns3-examples-src: See source code for examples')
    cd "${srcdir}/ns-${pkgver}/build"
    install -dm755 "$pkgdir"/usr/lib/ns3
    mv -Tv examples "$pkgdir"/usr/lib/ns3/examples
}

package_ns3-examples-src() {
    pkgdesc+=" (prebuilt example sources)"
    optdepends=('ns3-examples: Run prebuilt examples')
    cd "${srcdir}/ns-${pkgver}"
    install -dm755 "$pkgdir"/usr/src/ns3
    mv -Tv examples "$pkgdir"/usr/src/ns3/examples
}

# [FIXME]: srcdir references in navbar
package_ns3-docs() {
    pkgdesc+=" (Doxygen documentation)"
    makedepends=(doxygen graphviz imagemagick dia)

    cd "${srcdir}/ns-${pkgver}"
    install -dm755 "$pkgdir/usr/share/doc/$pkgbase"
    # HTML Doxygen docs
    mv -Tv doc/html "$pkgdir/usr/share/doc/$pkgbase/html"
    # FIXME: optimize docs so they don't take like 1GB of disk space
}

package_python-ns3() {
    pkgdesc+=" (Python bindings)"
    depends=(ns3 python-cppyy)
    # PyViz visualizer
    depends+=(python-cairo python-pygraphviz ipython)
    # Note: `root` package is not enough to satisfy deps
    #       (libcppyy is missing)
    conflicts=(root)
    # Try to lock to python version due to bindings
    [ -n "$pkgdir" ] && depends+=("python>=$(_pver).0" "python<$(_pver_next).0")
    mv python/* "$pkgdir"
}

# vim: set ts=4 sw=4 et :
