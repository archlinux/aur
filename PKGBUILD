# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-bin
_pkgname=${pkgname%-bin}
pkgver="0.3.9"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents"
arch=('x86_64' 'aarch64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("ClawX-0.3.9-linux-amd64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.3.9/ClawX-0.3.9-linux-amd64.deb")
sha512sums_x86_64=('d9c239f33fa4d440f512ec1f31f47b45670451dc914a29b73f6e8ff1eb0a256d9266ccc9a38f4e6072a5cf7ec15e29323dcdfc1a2bf830958dcd6f58490785ce')
source_aarch64=("ClawX-0.3.9-linux-arm64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.3.9/ClawX-0.3.9-linux-arm64.deb")
sha512sums_aarch64=('fe2309c185bfc97ec8ff68ba63d9416f9b7200f8076bb86828f803fa71bed72329d33e1a6f104f207fde5fd9c650ff64f14a963cd18080b051865177424f50b3')

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
