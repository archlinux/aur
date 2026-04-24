# Maintainer:  SpacingBat3 <spacingbat3+aur@gmail.com>
# Contributor: Kuan-Yen Chou <kychou2 at illinois dot edu>
# Contributor: Yunhui Fu <yhfudev@gmail.com>

pkgbase=ns3
pkgname=(
    # Fully functional components
    ns3
    ns3-examples{,-src} # FIXME: distribute this??? Any cons?
    # python-ns3 #FIXME: There's a lot of effort to be done to have Python bindings working.
    # ns3-docs #FIXME: Doxygen output is damn large!
    # ---
    # You may optionally enable the WIP components at build time,
    # PKGBUILD will handle the rest:
    $_NS3_ENABLE_WIP
    #^e.g. _NS3_ENABLE_WIP="ns3-docs" makepkg ...
)
pkgver=3.47
pkgrel=5
pkgdesc='Discrete-event network simulator for Internet systems'
arch=('x86_64')
url='https://www.nsnam.org/'
license=('GPL-2.0-only')
# Those are also needed on compile time,
# `makepkg -s` needs this at toplevel else
# only AUR helpers might work.
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
    # 5. Openflow
    openflow boost-libs
    # 6. Brite
    brite
    # 7. Click
    click-ns3
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
makedepends=(
    ### Required, according to docs
    python gcc cmake ninja git
    ### Additional components
    # Openflow (devel) [FIXME!]
    boost
    # Eigen3 (vector math lib, header-only)
    eigen3
    # Sphinx documentation
    # TODO!
)
conflicts=()
source=(
    "https://www.nsnam.org/releases/ns-${pkgver}.tar.bz2"
    0001-fix-newer-dpdk-versions.patch
    0002-disable-python-tests.patch
)

sha256sums=('8b3adca956c834ea436b915986ab8fd053e90041acae7426895d595aaa3ccc39'
            '9f519502828ffb403948d2601eb36e807e92d21793e985f63c90150de62626e5'
            '24d9c5dad607c2334669374ab5242e11bef85bc0f90bd17868601c7f23c9f2be')
sha512sums=('41a060b93e88bc389ef1f316b8e4568be2ca559f6a2e4b54bca29b6620e9fbb78e2ed0eec4c8b3b119f071aad43dfa09edbd2bf78ea125744a44f2366724d50c'
            '91d0f73f65053384c23f3c59d38bd8a988ba5ada97b62919b50e74daccb89cbc32bb32b7b1f84bb5426158325353fac306a5edcdce0690359fdaa82b0421679a'
            '74158c80b159d1587d51dddffcc6f24689985d4afe5574e3edb7691e5bb892bb160a3b717ce2352293c92c0359c799a4e4da4e0bba6c227ffa9bc534a2199a2c')
b2sums=('c03622d72afc5043aced4aa8ee39b477a15feb28e45142c6d4117a4ffd94c146d522200ac829831b1e9e89bb8bcd17f2f9e66306ba1a6bae9300b68025648f85'
        '83fbc3bb43094ee08bee4741c8d343de8a3b84a1b3f151d311586b3d3adf3b35142ca6295c7d15901514cafc891a51432e1a5188bef6491465984f587d531edc'
        'd8a7efeff13bbf1884502ae5e469f47be3c72a7f22a13e70c381aa02ccc94d4f41961ede107bba87a68b9144ba5f20818a40d6a20908344fad818c296a034fd3')

# Installation prefix
# leaving there for possible /opt
# packaging on-demand if needed.
#
# This might get useful if isolation
# will be mandatory, eg. to avoid conflicts
# with Arch packages / software.
_pkgprefix="/usr"

# [GENERATED] package enablements
# This is so it is possible to control components
# to be built via pkgname() array.
_has_docs=false
_has_python=false
for _searchpkg in "${pkgname[@]}"; do
    if [ "$_searchpkg" == "ns3-docs" ]; then
        _has_docs=true
    fi;
    if [ "$_searchpkg" == "python-ns3" ]; then
        _has_python=true
    fi;
    if $_has_python && $_has_docs; then break; fi
done;

# Additional dependencies on alternative configurations
if $_has_python; then
    # Bindings requirements
    makedepends+=(python-cppyy)
else
    # Enable MPI feature as it does
    # conflict with Python bindings
    depends+=(openmpi)
fi

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
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    local ns3_options=(
        ### GENERAL ###
        --build-profile=default
        --enable-build-version
        #--enable-monolib
        # ^FIXME: I need to check why it didn't
        #         install or if it causes problems.
        ### INTEGRATIONS ###
        --enable-dpdk
        --enable-eigen
        --enable-gsl
        --enable-gtk
        --enable-logs
        ### ADDITIONAL COMPONENTS ###
        --enable-examples
        --enable-tests
        # Prefix for packaged software
        --prefix="$_pkgprefix"
        ### COMPONENT DIRS ###
        --with-click="$_pkgprefix"
        --with-openflow="$_pkgprefix"
    )
    local cmake_options=(
        ### ADDITIONAL PATH DEFINITIONS ###
        # libexec is lib/[package] per guidelines
        -DCMAKE_INSTALL_LIBEXECDIR="lib/$pkgname/"
        ### INTEGRATIONS INTO ARCHLINUX ###
        # Allows for linker overrides (via /etc/makepkg.conf)
        # Otherwise, this enforces MOLD when installed.
        -DNS3_FAST_LINKERS=OFF
    )
    # OPTION 1: Python bindings build (FIXME!)
    if $_has_python; then
        ns3_options+=(--enable-python-bindings --disable-mpi)
        cmake_options+=(-DNS3_BINDINGS_INSTALL_DIR="$site_packages")
    # OPTION 2: MPI build
    else
        ns3_options+=(--enable-mpi)
    fi
    ./ns3 configure "${ns3_options[@]}" -- "${cmake_options[@]}"
    ./ns3 build
    # Generate docs (if enabled)
    if $_has_docs; then
        ./ns3 docs doxygen-no-build
        break
    fi
}

check() {
    cd "${srcdir}/ns-${pkgver}"
    # FIXME: Working Python tests (depends on working bindings)
    #env \
    #    PYTHONPATH="$PYTHONPATH${$PYTHONPATH:+:}${srcdir}/ns-${pkgver}/build/bindings/python" \
    ./test.py \
        --verbose-failed \
        --no-build \
        --duration \
        --multiple
}

package_ns3() {
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
    if $_has_python; then
        _pick python usr/lib/python$(_pver)
    fi
}

package_ns3-examples() {
    pkgdesc+=" (prebuilt example applications)"
    depends=("ns3=$pkgver")
    optdepends=('ns3-examples-src: See source code for examples')
    cd "${srcdir}/ns-${pkgver}/build"
    install -dm755 "$pkgdir"/usr/lib/ns3
    mv -Tv examples "$pkgdir"/usr/lib/ns3/examples
}

package_ns3-examples-src() {
    pkgdesc+=" (prebuilt example sources)"
    depends=()
    optdepends=('ns3-examples: Run prebuilt examples')
    cd "${srcdir}/ns-${pkgver}"
    install -dm755 "$pkgdir"/usr/src/ns3
    mv -Tv examples "$pkgdir"/usr/src/ns3/examples
}

# [FIXME]: srcdir references in navbar
package_ns3-docs() {
    pkgdesc+=" (Doxygen documentation)"
    depends=("ns3=$pkgver")
    makedepends=(doxygen graphviz imagemagick dia)

    cd "${srcdir}/ns-${pkgver}"
    install -dm755 "$pkgdir/usr/share/doc/$pkgbase"
    # HTML Doxygen docs
    mv -Tv doc/html "$pkgdir/usr/share/doc/$pkgbase/html"
    # FIXME: optimize docs so they don't take like 1GB of disk space
}

package_python-ns3() {
    pkgdesc+=" (Python bindings)"
    depends=("ns3=$pkgver" python-cppyy)
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
