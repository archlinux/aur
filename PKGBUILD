# Maintainer: Ashintosh <ash[at]ashinto[dot]sh>

pkgname=squawker-vpn-bin
pkgver=1.0.0
pkgrel=3
pkgdesc='TryHackMe Squawker VPN Client'
arch=('x86_64' 'aarch64')
url='https://tryhackme.com'
license=('custom')

options=('!strip')
depends=(
    'gtk3'
    'webkit2gtk-4.1'
    'libayatana-appindicator'
    'libappindicator'
)

provides=('squawker-vpn')
conflicts=('squawker-vpn')

source_x86_64=("${pkgname}-${pkgver}.deb"::https://squawker-vpn.vm.tryhackme.com/latest/squawker-vpn_${pkgver}_amd64.deb)
sha256sums_x86_64=('38a00ceac379b2cbfbc87bd103d96ee8214fc3b5a7dc52210e28af13deab188c')

source_aarch64=("${pkgname}-${pkgver}.deb"::https://squawker-vpn.vm.tryhackme.com/latest/squawker-vpn_${pkgver}_arm64.deb)
sha256sums_aarch64=('32494cfae221503912f9222a447e49e93fe272c2269a3e7ad9af58016a1c21a3')

install="${pkgname}.install"

prepare() {
    cd "${srcdir}" || return 1

    ar x "${pkgname}-${pkgver}.deb" || return 1

    if ! compgen -G "${srcdir}/data.tar.*" > /dev/null; then
        printf 'ERROR: no data.tar archive found in the Debian package\n' >&2
        return 1
    fi
}

package() {
    local data_archive

    data_archive=$(find "${srcdir}" -maxdepth 1 -type f -name 'data.tar.*' -print -quit)

    if [[ -z "${data_archive}" ]]; then
        printf 'ERROR: no data.tar archive found in %s\n' "${srcdir}" >&2
        return 1
    fi

    bsdtar -xf "${data_archive}" -C "${pkgdir}" || return 1

    # Relocate Debian's systemd unit to Arch's /usr/lib layout
    if [[ -f "${pkgdir}/lib/systemd/system/squawker-vpn-helper.service" ]]; then
        install -Dm644 \
            "${pkgdir}/lib/systemd/system/squawker-vpn-helper.service" \
            "${pkgdir}/usr/lib/systemd/system/squawker-vpn-helper.service" \
            || return 1

        rm -rf "${pkgdir}/lib" || return 1
    fi

    # Install the upstream license in Arch's standard license directory
    if [[ -f "${pkgdir}/usr/lib/squawker-vpn/_up_/LICENSE.txt" ]]; then
        install -Dm644 \
        "${pkgdir}/usr/lib/squawker-vpn/_up_/LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt" \
        || return 1
    else
        printf 'ERROR: upstream LICENSE.txt was not found\n' >&2
        return 1
    fi
}
