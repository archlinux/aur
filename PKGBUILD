# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-bin
_pkgname=${pkgname%-bin}
pkgver="0.6.1"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents"
arch=('x86_64' 'aarch64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("ClawX-0.6.1-linux-amd64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.6.1/ClawX-0.6.1-linux-amd64.deb")
sha512sums_x86_64=('bc0b10077c89b3208e0bbbb4b2382d9b330efebffb8f9fef457bee24c69ef62a9437507b78a7ca517fef9957be45edceb33dcbbb517739464d85463ed80a063d')
source_aarch64=("ClawX-0.6.1-linux-arm64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.6.1/ClawX-0.6.1-linux-arm64.deb")
sha512sums_aarch64=('fe1b238ecd62da4d2e24aca25b240a248b8f5937f96efa962c850cc51c268d77c93385690aba2e9cc7d4841c057c380e87e83fae45d0daef2255b95f04290afd')

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
