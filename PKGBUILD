# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-bin
_pkgname=${pkgname%-bin}
pkgver="0.4.15"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents"
arch=('x86_64' 'aarch64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("ClawX-0.4.15-linux-amd64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.4.15/ClawX-0.4.15-linux-amd64.deb")
sha512sums_x86_64=('bcbab0e3dcc825a5b69680846f43ef6d90aff60020facdc284eddbbc6d8a183ddbe7ea6edef14750c5bd5ce00134800e644ef07d8407a9834522aeb337a6f07c')
source_aarch64=("ClawX-0.4.15-linux-arm64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.4.15/ClawX-0.4.15-linux-arm64.deb")
sha512sums_aarch64=('7268b8ec5d2a10d824fdf9f1d6e3ed755854ca27c0d53781adf9deb76b14c831a069490158681d490b2b8975c904c230422a1923472bc3ea5819770e1c4dc6c2')

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
