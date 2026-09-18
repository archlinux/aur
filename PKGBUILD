# Contributor: Rafael Silva <perigoso at riseup dot net>
# Maintainer: Julian Houba <info at craftingdragon dot ch>

_name=pvxs
pkgname=epics-pvxs
pkgver=1.5.2
pkgrel=1
pkgdesc='EPICS PVA protocol client/server library and utilities'
arch=('x86_64')
url='https://epics-base.github.io/pvxs/'
license=('BSD-3-Clause')
depends=(
    'epics-base'
    'gcc-libs'
    'glibc'
    'libevent'
)
source=("${_name}-${pkgver}.tar.gz::https://github.com/epics-base/pvxs/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('061506998fcbfeb376ddf9c85095405197cf23a9f03a932984c40be4aa817cb0')

prepare() {
    cd "${_name}-${pkgver}"

    # EPICS requires this setting to come from a RELEASE file, not the
    # environment or make command line.  The system libevent is found through
    # its standard include and library paths, so no bundled copy is used.
    printf 'EPICS_BASE = /usr/lib/epics\n' > configure/RELEASE.local
}

build() {
    cd "${_name}-${pkgver}"

    make \
        INSTALL_LOCATION="${srcdir}/install" \
        FINAL_LOCATION='/usr/lib/epics/pvxs'

    # EPICS generates the soft IOC registration source with the staging
    # prefix.  Replace it before its final link so the installed binary finds
    # its DBD files below the actual package prefix.
    local _arch
    _arch=$(perl /usr/lib/epics/lib/perl/EpicsHostArch.pl)
    PVXS_STAGE="${srcdir}/install" PVXS_FINAL='/usr/lib/epics/pvxs' \
        perl -pi -e 's{\Q$ENV{PVXS_STAGE}\E}{$ENV{PVXS_FINAL}}g' \
        "qsrv/O.${_arch}/softIocPVX_registerRecordDeviceDriver.cpp"
    make -C "qsrv/O.${_arch}" -f ../Makefile TOP=../.. T_A="${_arch}" \
        INSTALL_LOCATION="${srcdir}/install" \
        FINAL_LOCATION='/usr/lib/epics/pvxs' \
        softIocPVX
    install -Dm755 "qsrv/O.${_arch}/softIocPVX" \
        "${srcdir}/install/bin/${_arch}/softIocPVX"
}

package() {
    install -d "${pkgdir}/usr/lib/epics/pvxs"

    local _arch _file _target
    _arch=$(perl /usr/lib/epics/lib/perl/EpicsHostArch.pl)
    while IFS= read -r -d '' _file; do
        _target="${pkgdir}/usr/lib/epics/pvxs/${_file#"${srcdir}/install/"}"
        if [[ -x ${_file} ]]; then
            install -Dm755 "${_file}" "${_target}"
        else
            install -Dm644 "${_file}" "${_target}"
        fi
    done < <(find "${srcdir}/install" -type f -print0)

    while IFS= read -r -d '' _file; do
        _target="${pkgdir}/usr/lib/epics/pvxs/${_file#"${srcdir}/install/"}"
        install -d "$(dirname "${_target}")"
        ln -s "$(readlink "${_file}")" "${_target}"
    done < <(find "${srcdir}/install" -type l -print0)

    # Keep the EPICS installation self-contained, while making the public
    # command-line utilities available through the normal system command path.
    install -d "${pkgdir}/usr/bin"
    for _file in \
        pvxcall pvxget pvxinfo pvxlist pvxmonitor pvxmshim pvxput pvxvct \
        softIocPVX; do
        ln -sr "${pkgdir}/usr/lib/epics/pvxs/bin/${_arch}/${_file}" \
            "${pkgdir}/usr/bin"
    done

    printf '/usr/lib/epics/pvxs/lib/linux-%s\n' "${CARCH}" | \
        install -Dm644 /dev/stdin "${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf"

    install -Dm644 "${_name}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
