# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-bin
_pkgname=${pkgname%-bin}
pkgver="0.4.3"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents"
arch=('x86_64' 'aarch64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("ClawX-0.4.3-linux-amd64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.4.3/ClawX-0.4.3-linux-amd64.deb")
sha512sums_x86_64=('fdbc04e29c924a988b21b2b35096807c947038e6d456eb3fa2111258e661e42bce7d5202d34d6707aa183b71cab9e871534620d72bac6810c5344d2e51c1d573')
source_aarch64=("ClawX-0.4.3-linux-arm64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.4.3/ClawX-0.4.3-linux-arm64.deb")
sha512sums_aarch64=('06d76cf8b2052dd8229c43c147f9a6c504776e0b6e0e179d5a3c1697f615730def71fc774752c529a4e7da50e3560d2aca855536965e1ee6783ae6a7906dc819')

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
