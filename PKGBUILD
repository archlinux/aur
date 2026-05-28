# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-bin
_pkgname=${pkgname%-bin}
pkgver="0.4.7"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents"
arch=('x86_64' 'aarch64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("ClawX-0.4.7-linux-amd64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.4.7/ClawX-0.4.7-linux-amd64.deb")
sha512sums_x86_64=('fd77febe21a3e0c5026704f69a53f15cb9e08eac55cf5d4daf72eac0d2f9702ff174ad958c47876f695c3c14be70854bb09ffc935c8943eb544c1e91a2bd0c9f')
source_aarch64=("ClawX-0.4.7-linux-arm64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.4.7/ClawX-0.4.7-linux-arm64.deb")
sha512sums_aarch64=('47b3113b4070d195d0cde3fd55e3e40a2f2fba258a6d057bba374dab19b057875d579804454a59740f7830c7e2502a778fb1c5d5be4ffce1ff3000ed01d1a137')

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
