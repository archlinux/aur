# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-bin
_pkgname=${pkgname%-bin}
pkgver="0.5.1"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents"
arch=('x86_64' 'aarch64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("ClawX-0.5.1-linux-amd64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.5.1/ClawX-0.5.1-linux-amd64.deb")
sha512sums_x86_64=('3189369a5d090a976b0cdf401806e8d3c68f18c0353c98ddee26f99cc48013dd1e18d55d49ba79435b0051efcdc7d65a3680b4f6d3fd632977886cc63e249e9f')
source_aarch64=("ClawX-0.5.1-linux-arm64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.5.1/ClawX-0.5.1-linux-arm64.deb")
sha512sums_aarch64=('3888be81bd65284893433b6dacc93342b0631d04ba5a6b7f6beb3672b2eb6249bf7e08ac312d9618a0982d83473c97d103a8ee09e45d1ce6aeec3b36a520b160')

package() {
    local _debdir="${srcdir}/deb-extract"
    local _datadir="${srcdir}/deb-data"
    local _data_archive
    local _deb_arch

    case "${CARCH}" in
        x86_64) _deb_arch='amd64' ;;
        aarch64) _deb_arch='arm64' ;;
        *) echo "Unsupported architecture: ${CARCH}" >&2; return 1 ;;
    esac

    rm -rf "${_debdir}" "${_datadir}"
    mkdir -p "${_debdir}" "${_datadir}"

    cd "${_debdir}"
    ar x "${srcdir}/ClawX-${pkgver}-linux-${_deb_arch}.deb"

    _data_archive=$(printf '%s\n' data.tar.*)
    bsdtar -xf "${_data_archive}" -C "${_datadir}"

    cp -a "${_datadir}/." "${pkgdir}/"
}
