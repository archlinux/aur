# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-bin
_pkgname=${pkgname%-bin}
pkgver="0.4.4"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents"
arch=('x86_64' 'aarch64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("ClawX-0.4.4-linux-amd64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.4.4/ClawX-0.4.4-linux-amd64.deb")
sha512sums_x86_64=('024fef985aff86417b6d2be91d18ef0c3253f2ebd8cc109eeeb48f2767ae5299d69a119647128de1d787cc15c4a70c41ae49fa64f05abd4fad81f410d7554463')
source_aarch64=("ClawX-0.4.4-linux-arm64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.4.4/ClawX-0.4.4-linux-arm64.deb")
sha512sums_aarch64=('3c2fa78bd7d405dc2fa44f2fa5d27747d609cbc8c523495abaf64a82be03a6d75243a6a7881a38dc2fb0de946be0ceb3adc285b1ab28634082e40486dec2d49e')

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
