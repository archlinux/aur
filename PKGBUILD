# Contributor: Grey Christoforo <first name at last name dot net>
# Contributor: Rafael Silva <perigoso at riseup dot net>

pkgname='epics-base'
pkgver=7.0.7
pkgrel=2
pkgdesc="Experimental Physics and Industrial Control System"
arch=('any')
url="https://epics-controls.org"
license=('custom:EPICS Open License')
groups=('epics')
depends=('readline' 'ncurses' 'perl')
makedepends=()
source=("https://epics-controls.org/download/base/base-${pkgver}.tar.gz"{,.asc}
        '00_install_locations.patch'
        '01_install_permissions.patch'
        '02_no_rpath.patch'
        '03_no_debug_symbols.patch'
)
sha512sums=('f72e4f7b27f39a18540346184ef185b7fb3ecab4df4e4f66b86c44c39a35a1a236a580f79a089b857ec276b129760d6faedbc3a8b4c9bde8f3528c35b01aa155'
            'SKIP'
            'c55d53895af137706d99500b72f18ffb580ec98ab3ededb69a85fefc15539e4853fc46d7b31ea364195f3b9423066fbcd9ae4bd4b31cacb0328fa230fe5698f6'
            '760dda09dbd9e84b96e6d5e34183e9ff383ea7403e1c751e07e4c0ca734bc1837d4d595f403f471d76845e5967bdcbe6340919c07ad3127be05e2008d2880fa4'
            '394b023fe3003e61701c8c31d44c17281297a3b67f3bbe604e9191f38267986c34b06fe24eae5e778a29b466b022bdce5d4d0f4061da9c91a44467f1e0d266a3'
            'd8337a9ee5a9c1ca2c1aa3ee8e45c0507f9386a590474e0345ff903ec7ebd56feed739c46a56c6dced56129ca4d6e783b72d01a25f6346daaf7ce34127fd9903')
validpgpkeys=('4B688BF5CAF9452CBD5BE86FD306120EEACB4576') # Andrew Johnson (Argonne)

prepare() {
    cd "base-${pkgver}"

    # apply patches
    patch --forward --strip=1 --input="${srcdir}/01_install_permissions.patch"
    patch --forward --strip=1 --input="${srcdir}/02_no_rpath.patch"
    patch --forward --strip=1 --input="${srcdir}/03_no_debug_symbols.patch"

    # disabled because it causes severe breakage of EPICS build system
    # patch --forward --strip=1 --input="${srcdir}/00_install_locations.patch"

    # install files to staging area
    echo "INSTALL_LOCATION=${srcdir}/staging/usr/lib/epics" >'configure/CONFIG_SITE.local'

    # final install location
    echo 'FINAL_LOCATION=/usr/lib/epics' >>'configure/CONFIG_SITE.local'

    # get the EPICS_HOST_ARCH and write it to a file
    echo $(perl -CSD src/tools/EpicsHostArch.pl) >"${srcdir}/EPICS_HOST_ARCH"
}

build() {
    cd "base-${pkgver}"

    # get the EPICS_HOST_ARCH and set it as an environment variable
    export EPICS_HOST_ARCH=$(cat "${srcdir}/EPICS_HOST_ARCH")

    # export the library path for the linker at build time
    export LD_LIBRARY_PATH="${srcdir}/staging/usr/lib/epics/lib/${EPICS_HOST_ARCH}"

    # export perl library path for build time resolution
    # export PERL5LIB="${srcdir}/staging/usr/lib/epics/lib/perl"

    # build and install to staging area, "-s" for silent build
    make -s
}

package() {
    cd "staging/usr/lib/epics"

    # everything is installed relative to EPICS_BASE and linked to the system paths
    # because a lot of the EPICS tools and epics modules expect the files to be in these locations

    # get the EPICS_HOST_ARCH and set it as an local variable
    local EPICS_HOST_ARCH=$(cat "${srcdir}/EPICS_HOST_ARCH")
    local EPICS_BASE="${pkgdir}/usr/lib/epics"

    # install library files and link them to the system library path
    install -dm755 "${EPICS_BASE}/lib/${EPICS_HOST_ARCH}"
    cp -P "lib/${EPICS_HOST_ARCH}"/*.so* "${EPICS_BASE}/lib/${EPICS_HOST_ARCH}"
    for lib in "${EPICS_BASE}/lib/${EPICS_HOST_ARCH}"/*.so*; do
        ln -sr "${lib}" "${pkgdir}/usr/lib/"
    done

    # install perl modules and link them to the system perl path
    cp -r lib/perl "${EPICS_BASE}/lib"
    local PERL_VERSION=$(perl -V:version | perl -pe '($_)=/([0-9]+([.][0-9]+)?)/')
    install -dm755 "${pkgdir}/usr/lib/perl5/${PERL_VERSION}/vendor_perl" "${pkgdir}/usr/share/perl5/vendor_perl"
    for module in DBD EPICS CA.pm DBD.pm; do
        ln -sr "${EPICS_BASE}/lib/perl/${module}" "${pkgdir}/usr/share/perl5/vendor_perl"
    done
    for lib in $(find "${EPICS_BASE}/lib/perl" -name '*.so'); do
        ln -sr "${lib}" "${pkgdir}/usr/lib/perl5/${PERL_VERSION}/vendor_perl"
    done

    # install bin files and link non internal binaries to system path
    install -dm755 "${EPICS_BASE}/bin/${EPICS_HOST_ARCH}" "${pkgdir}/usr/bin"
    cp -P "bin/${EPICS_HOST_ARCH}"/* "${EPICS_BASE}/bin/${EPICS_HOST_ARCH}"
    for bin in caget caput cainfo camonitor caRepeater casw pvget pvinfo pvlist pvput; do
        ln -sr "${EPICS_BASE}/bin/${EPICS_HOST_ARCH}/${bin}" "${pkgdir}/usr/bin"
    done

    # move services to the system path
    install -dm755 "${pkgdir}/usr/lib/systemd/system"
    for service in "${EPICS_BASE}/bin/${EPICS_HOST_ARCH}"/*.service; do
        mv "${service}" "${pkgdir}/usr/lib/systemd/system"
    done

    # install include files and link them to the system include path
    install -dm644 "${pkgdir}/usr/include/epics"
    cp -r include "${EPICS_BASE}"
    ln -sr -t "${pkgdir}/usr/include/epics" "${EPICS_BASE}/include"

    # cfg, configure, db, dbd are installe to EPICS_BASE and don't have appropriate system locations
    install -dm755 "${pkgdir}/usr/share/epics"
    cp -rt "${EPICS_BASE}" cfg configure db dbd templates
    for dir in db dbd templates; do
        ln -sr "${EPICS_BASE}/${dir}" "${pkgdir}/usr/share/epics"
    done

    # exclude the local site configuration
    rm "${EPICS_BASE}/configure/CONFIG_SITE.local"

    # install pkgconfig files to the system path
    install -Dm755 -t "${pkgdir}/usr/lib/pkgconfig" lib/pkgconfig/epics-base{,"-${EPICS_HOST_ARCH}"}.pc

    # install docs
    install -dm644 "${pkgdir}/usr/share/doc/epics"
    cp -r html "${pkgdir}/usr/share/doc/epics"

    # install LICENSE file
    install -Dm644 "${srcdir}/base-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # install a env file to set the EPICS_HOST_ARCH and EPICS_BASE
    install -dm755 "${pkgdir}/usr/lib/environment.d"
    echo "# Entries in this file set the host environment for EPICS" >"${pkgdir}/usr/lib/environment.d/10-epics-base.conf"
    echo "EPICS_HOST_ARCH=\"${EPICS_HOST_ARCH}\"" >>"${pkgdir}/usr/lib/environment.d/10-epics-base.conf"
    echo "EPICS_BASE=\"/usr/lib/epics\"" >>"${pkgdir}/usr/lib/environment.d/10-epics-base.conf"

    # TODO: makepkg complains the package contains references to $srcdir
    # Debug flags are removed with `03_no_debug_symbols.patch`, unclear why it's still referenced

    # TODO: split the package into base and modules
}
