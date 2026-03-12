# Maintainer:  SpacingBat3 <spacingbat3+aur@gmail.com>
# Contributor: Kuan-Yen Chou <kychou2 at illinois dot edu>
# Contributor: Yunhui Fu <yhfudev@gmail.com>

pkgname=ns3 # Note: please do ns3-allinone for "allinone" source variant
# FIXME: make it split package: ns3 python-ns3 (others???)
pkgver=3.47
pkgrel=1
pkgdesc='Discrete-event network simulator for Internet systems'
arch=('x86_64')
url='https://www.nsnam.org/'
license=('GPL-2.0-only')
depends=(
    ### Required, definitely for runtime
    python
    ### Optional (most likely needed after/during compiling, allow more features)
    # 1. Database support
    sqlite3
    # 2. NetAnim support
    qt5-base qt5-tools # = base+qtchooser+qmake
    # 3. MPI (distributed computing) support
    #openmpi # disabled due to conflicts with python bindings (possible future FIXME? compile twice and package-level conflicts?)
    # 4. GNU Scientific Library
    gsl
    # 5. XML config store
    libxml2
    # 6. GTK configuration
    gtk3
    # 7. Eigen3 (vector math lib)
    eigen3
    # 8. Virtual machines (optdeps???)
    lxc iproute2 iptables
    # 9. Openflow (FIXME!)
    # openflow boost-libs
    # 10. PyViz visualizer
    goocanvas python-cairo python-pygraphviz ipython
    # 11. Brite
    brite
    # 12. Click (FIXME!)
    # clickrouter
    # 13. DPDK
    dpdk
    # 14. Netmap emulation FdNetDevice
    # netmap # NEEDS AUR PACKAGE FIX FOR CUSTOM KERNELS!
)
makedepends=(
    ### Required, according to docs
    gcc cmake ninja git
    ### Optional, seems to be build deps
    # 1. Doxygen documentation
    doxygen graphviz imagemagick
    # 2. Sphinx documentation
    # TODO!
    # 3. Openflow (devel)
    # boost
    # 4. Python bindings
    python-cppyy python-cxxfilt
)
optdepends=(
    # FIXME: Some deps may land there safely
    {tcpdump,wireshark-{cli,qt}}': PCAP file reader'

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

build() {
    cd "${srcdir}/ns-${pkgver}"
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
        --enable-python-bindings \
        --prefix=/usr \
        -- \
        -DNS3_BINDINGS_INSTALL_DIR="/usr/lib/python$(_pver)/site-packages" \
        -DNS3_PIP_PACKAGING:BOOL=ON
        # FIXME!:
        #--enable-tests \
        #--with-click="$srcdir/click-git/install" \
        #--with-openflow="$openflow_dir" \
        # Disabled:
        #--enable-mpi \ # Incompatible with Python bindings
                        # (I assume Python is better for consumer-grade
                        # hardware or development on NS-3)
    ./ns3 build
}

# FIXME: add tests
# (not the most important thing, but still)
#check() {}

package() {
    # Try to lock to python version due to bindings
    [ -n "$pkgdir" ] && depends+=("python>=$(_pver).0" "python<$(_pver_next).0")
    cd "${srcdir}/ns-${pkgver}"
    DESTDIR="$pkgdir" ./ns3 install
    # FIXME: package split, e.g. python bindings in its own package.
}

# vim: set ts=4 sw=4 et :
