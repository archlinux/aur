# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-bin
_pkgname=${pkgname%-bin}
pkgver="0.3.10"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents"
arch=('x86_64' 'aarch64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("ClawX-0.3.10-linux-amd64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.3.10/ClawX-0.3.10-linux-amd64.deb")
sha512sums_x86_64=('607f06f66601077146529396971f74aa1a60f27d0e2afb0ba5417879f9a25ae7c5a80ff5f89e693be178e71dbb8cf93372213aca2b7190729ed547ee97ab32e2')
source_aarch64=("ClawX-0.3.10-linux-arm64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.3.10/ClawX-0.3.10-linux-arm64.deb")
sha512sums_aarch64=('0ea487253d550195811bc9f877ac6970f325e495c83af631763a3a893db9ea40842402f256ced4ede44c18ef4287d7c9a7046e076dfe0ab210b8f379161524b2')

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
