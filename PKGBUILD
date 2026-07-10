# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-bin
_pkgname=${pkgname%-bin}
pkgver="0.4.16"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents"
arch=('x86_64' 'aarch64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("ClawX-0.4.16-linux-amd64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.4.16/ClawX-0.4.16-linux-amd64.deb")
sha512sums_x86_64=('3794f293b7cd420481b01bca536e10f3aa73b3c1ab4e5beb8cf112b71761e4b96d8d8237eabc449aa36810bbbd48653564fc8f6484b8955e2bc97e3fc2ce31dd')
source_aarch64=("ClawX-0.4.16-linux-arm64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.4.16/ClawX-0.4.16-linux-arm64.deb")
sha512sums_aarch64=('7f720a89465310e76a2e2d62f24b1f4bc15b2463fb674d840584e5c68c9c5e25d5a0a18762911aa5053c27c8d967545218be53936bc7400e745b32f400b66ffe')

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
