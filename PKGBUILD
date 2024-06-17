# Contributor: Rafael Silva <perigoso at riseup dot net>

pkgname='epics-pvxs'
pkgver=1.3.1
pkgrel=1
pkgdesc="PVA protocol client/server library and utilities"
arch=('any')
url="https://mdavidsaver.github.io/pvxs"
license=('custom')
depends=('epics-base' 'libevent')
makedepends=()
source=("https://github.com/mdavidsaver/pvxs/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('6b1f477a1b8dbb90004baa62fb96d1a0f4375ecf0513000b9e206b0b9d49dffa3189e5337c14f4cb2b8b9e19b62ae8af3b57e8787cb41035ffd4d9987501e925')

prepare() {
    cd "pvxs-$pkgver"

    # set EPICS_BASE path
    echo "EPICS_BASE=/usr/lib/epics" >'configure/RELEASE.local'

    # install files to staging area
    echo "INSTALL_LOCATION=${srcdir}/staging/usr/lib/epics" >'configure/CONFIG_SITE.local'

    # final install location
    echo 'FINAL_LOCATION=/usr/lib/epics' >>'configure/CONFIG_SITE.local'

    # get the EPICS_HOST_ARCH and write it to a file
    echo $(perl -CSD /usr/lib/epics/lib/perl/EpicsHostArch.pl) >"${srcdir}/EPICS_HOST_ARCH"
}

build() {
    cd "pvxs-$pkgver"

    # get the EPICS_HOST_ARCH and set it as an environment variable
    export EPICS_HOST_ARCH=$(cat "${srcdir}/EPICS_HOST_ARCH")

    # build and install to staging area, "-s" for silent build
    make -s
}

package() {
    cd "staging/usr/lib/epics"

    # set EPICS_HOST_ARCH and EPICS_BASE as a local variable
    local EPICS_HOST_ARCH=$(cat "${srcdir}/EPICS_HOST_ARCH")
    local EPICS_BASE="${pkgdir}/usr/lib/epics"

    # install library files and link them to the system library path
    install -dm755 "${EPICS_BASE}/lib/${EPICS_HOST_ARCH}"
    cp -P "lib/${EPICS_HOST_ARCH}"/*.so* "${EPICS_BASE}/lib/${EPICS_HOST_ARCH}"
    for lib in "${EPICS_BASE}/lib/${EPICS_HOST_ARCH}"/*.so*; do
        ln -sr "${lib}" "${pkgdir}/usr/lib/"
    done

    # install bin files and link non internal binaries to system path
    install -dm755 "${EPICS_BASE}/bin/${EPICS_HOST_ARCH}" "${pkgdir}/usr/bin"
    cp -P "bin/${EPICS_HOST_ARCH}"/* "${EPICS_BASE}/bin/${EPICS_HOST_ARCH}"
    for bin in pvxcall pvxget pvxinfo pvxlist pvxmonitor pvxmshim pvxput pvxvct; do
        ln -sr "${EPICS_BASE}/bin/${EPICS_HOST_ARCH}/${bin}" "${pkgdir}/usr/bin"
    done

    # install include files and epics-base links the parent include directory to the system path
    install -dm644 "${pkgdir}/usr/include/epics/pvxs"
    cp -r include/pvxs "${EPICS_BASE}/include"

    # cfg, db, dbd are installe to EPICS_BASE and don't have appropriate system locations
    # configure not installed as it overlaps with epics-base configures
    install -dm755 "${pkgdir}/usr/share/epics"
    cp -rt "${EPICS_BASE}" cfg db dbd

    # install LICENSE file
    install -Dm644 "${srcdir}/pvxs-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # TODO: makepkg complains the package contains references to $srcdir
}
