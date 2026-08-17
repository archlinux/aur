# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-bin
_pkgname=${pkgname%-bin}
pkgver="0.5.4"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents"
arch=('x86_64' 'aarch64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("ClawX-0.5.4-linux-amd64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.5.4/ClawX-0.5.4-linux-amd64.deb")
sha512sums_x86_64=('a4002bcffba076ef74cc78476bc43618f5a7b5297069fbafde7b693592c452aeb1db79dc3e6e30febf78096df8bc21b3d0fa0b2108d4a9c913baf5c7be3ce2e0')
source_aarch64=("ClawX-0.5.4-linux-arm64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.5.4/ClawX-0.5.4-linux-arm64.deb")
sha512sums_aarch64=('ebb6693f9fc4932412092ebdcc2c82e2fdee778ab555ccbd9dd49bfdf348af056c716f92944a5c4db320ecae11dbd052c842f211ee1ba86159c7aaa95d6650a6')

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
