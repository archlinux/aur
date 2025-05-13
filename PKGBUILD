# Maintainer: Julian Houba <craftingdragon007 at outlook dot com>
# Contributor: Grey Christoforo <first name at last name dot net>
# Contributor: Rafael Silva <perigoso at riseup dot net>

pkgname='epics-base'
pkgver=7.0.9
pkgrel=2
pkgdesc="Experimental Physics and Industrial Control System"
arch=('any')
url="https://epics-controls.org"
license=('custom:EPICS Open License')
groups=('epics')
depends=('readline' 'ncurses' 'perl')
makedepends=()
source=("https://epics-controls.org/download/base/base-${pkgver}.tar.gz"{,.asc}
        '01_install_permissions.patch'
        '02_no_rpath.patch'
        '03_new_gcc_version_fix.patch'
)
sha512sums=('40accd1954ba750d250c88ef60289e99921d30235180824575a6b82325f10fe6d920b740e6895da9908be5465a2fa9b8004b8f004694e01f38cdc63e8c9ed430'
            'SKIP'
            '8d8ea744e1bd011c0a01c645a37cd29c420830389ce340820975ea798c6138ce28d7d5e066fe503025fb353a2e19c1a33169a3d5777414e60b42eb5b3874091a'
            '394b023fe3003e61701c8c31d44c17281297a3b67f3bbe604e9191f38267986c34b06fe24eae5e778a29b466b022bdce5d4d0f4061da9c91a44467f1e0d266a3'
            'd6e52695cb34647ffa4105f648898bb31dd5f77d67e8bf02e3f6650225ea75399383480278a9e63f0ee608fb1487c98702d27297b90cb8827b2c5377d761a113')
validpgpkeys=('4B688BF5CAF9452CBD5BE86FD306120EEACB4576') # Andrew Johnson (Argonne)

prepare() {
    cd "base-${pkgver}"

    # apply patches
    patch --forward --strip=1 --input="${srcdir}/01_install_permissions.patch"
    patch --forward --strip=1 --input="${srcdir}/02_no_rpath.patch"
    patch --forward --strip=1 --input="${srcdir}/03_new_gcc_version_fix.patch"

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

    for bin in softIoc softIocPVA; do
        ln -sr "${EPICS_BASE}/bin/${EPICS_HOST_ARCH}/${bin}" "${pkgdir}/usr/bin"
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

    # Patch epics config_site local install location to current folder (.)
    sed -i "s|${srcdir}/staging/usr/lib/epics|./usr/lib/epics|g" "${pkgdir}/usr/lib/epics/configure/CONFIG_SITE.local"

    # TODO: makepkg complains the package contains references to $srcdir
}
