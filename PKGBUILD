# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Maintainer:  JerryXiao (https://aur.archlinux.org/account/JerryXiao)
# Contributor: xiretza (https://aur.archlinux.org/account/xiretza)
# Contributor: phariseo <phariseo@hush.com>
# Contributor: ausbin (https://aur.archlinux.org/account/ausbin)

_pkgname=vlmcsd
pkgname=$_pkgname-git
pkgver=2604.r29.gbadb24e
_pkgreleasever="${pkgver%%.*}"
pkgrel=3
pkgdesc="Volume License Manager Service: KMS Emulator in C (for activating Microsoft products)"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/tfslabs/vlmcsd"
license=('LicenseRef-TheFlightSims_OSS_License')
provides=(
    "vlmcsd=${pkgver}"
    "libkms=${pkgver}"
    "libkms-git=${pkgver}"
    "libkms-static=${pkgver}"
    "libkms.a"
    "libkms.so"
)
conflicts=(
    'vlmcsd'
    'libkms'
    'libkms-static'
    'libkms.a'
    'libkms.so'
)
depends=('glibc')
makedepends=(
    'git'
    'groff'
    'gzip'
    'patchelf'
)
source=("git+$url.git"
        'vlmcsd.service'
        'vlmcsd@.service'
        'vlmcsd.socket')
sha256sums=('SKIP'
            '6fe8070a5d2d28f8a8179c9d02d5a905725e2e978af7e340a47024fa77809d02'
            '7ff86964df9796d30fe22c96b5ba843ef9f170d7a23c6e17565e312db59f20d7'
            'e791484ed6d747f4e17f004894350ef610215c94fe444bfa623755ce17a29e6b')

prepare() {
    cd "$_pkgname"

    git log > git.log
}

pkgver() {
    cd "$_pkgname"

    _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|-g[0-9a-f]*$||' -e 's|-|+|g')"
    _rev="$(git rev-list --count HEAD)"
    _hash="$(git rev-parse --short HEAD)"

    if [ -z "${_ver}" ]; then
        error "Version could not be determined."
        return 1
    else
        printf '%s' "${_ver}.r${_rev}.g${_hash}"
    fi
}

build() {
    cd "$_pkgname"

    local _makeopts="STRIP=0 VLMCSD_VERSION=${pkgver} VERBOSE=2 FEATURES=full"
    export CFLAGS+=' -DFULL_INTERNAL_DATA'
    export CXXFLAGS+=' -DFULL_INTERNAL_DATA'

    make ${_makeopts} libkms-static
    make ${_makeopts} libkms
    make ${_makeopts} vlmcs
    make ${_makeopts} vlmcsd
    make ${_makeopts} vlmcsdmulti
    # make ${_makeopts} unixdocs  # As of 2026-09-22, fails with `No rule to make target 'vlmcsd-floppy.7.unix.txt', needed by 'unixdocs'.  Stop.`, see https://github.com/tfslabs/vlmcsd/issues/43.
    # make ${_makeopts} pdfdocs   # As of 2026-09-22, fails with `No rule to make target 'vlmcsd-floppy.7.pdf', needed by 'pdfdocs'.  Stop.`, see https://github.com/tfslabs/vlmcsd/issues/43.
    cd man
    gzip -fk9 *.[0-9]
}

package() {
    local _unit
    for _unit in vlmcsd.service vlmcsd@.service vlmcsd.socket; do
        install -Dvm644 "$srcdir/$_unit" "$pkgdir/usr/lib/systemd/system/$_unit"
    done

    cd "$_pkgname"

    local _bin
    for _bin in vlmcs{,d,dmulti}; do
        install -Dvm755 "bin/$_bin" "$pkgdir/usr/bin/$_bin"
    done

    install -Dvm644 lib/libkms.a  "$pkgdir/usr/lib/libkms.a"
    install -Dvm755 lib/libkms.so "$pkgdir/usr/lib/libkms.so.${_pkgreleasever}"
    ln -svr "$pkgdir/usr/lib/libkms.so.${_pkgreleasever}" "$pkgdir/usr/lib/libkms.so"
    patchelf --set-soname "libkms.so.${_pkgreleasever}" "${pkgdir}/usr/lib/libkms.so.${_pkgreleasever}"

    pushd man > /dev/null
    local _manpage
    for _manpage in *.[0-9]; do
        section=${_manpage##*.}
        install -Dvm644 "$_manpage.gz" "$pkgdir/usr/share/man/man$section/$_manpage.gz"
    done
    popd > /dev/null

    install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"         git.log README.md SECURITY.md CODE_OF_CONDUCT.md Contributing.md
    install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/config"  config/*
    install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"     LICENSE
}

# vim: set ts=4 sw=4 et :
