# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-bin
_pkgname=${pkgname%-bin}
pkgver="0.4.10"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents"
arch=('x86_64' 'aarch64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("ClawX-0.4.10-linux-amd64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.4.10/ClawX-0.4.10-linux-amd64.deb")
sha512sums_x86_64=('c4c5ad494926deef352e1af27285abdcc8d7fdadbc789d633f5158f7b2808e82d3a4fa308b6f3fc2082e32323879c9a5b721abd770d43a44d3e552f5e92e2039')
source_aarch64=("ClawX-0.4.10-linux-arm64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.4.10/ClawX-0.4.10-linux-arm64.deb")
sha512sums_aarch64=('9aba7148ca26fef3a8fc2fdb01cbe9bb83b469621b1ab0cfff624b45a25a7cc9078f10bf9b2d71da03def520745f26197f2b025d5ea590401833a1e8b445f8f7')

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
