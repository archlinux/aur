# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-bin
_pkgname=${pkgname%-bin}
pkgver="0.4.2"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents"
arch=('x86_64' 'aarch64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("ClawX-0.4.2-linux-amd64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.4.2/ClawX-0.4.2-linux-amd64.deb")
sha512sums_x86_64=('4dec717aee1559274dfdabe938b02e83d087c96e80b4313ef3493d3cdc3da302986451aa588fc061aae90456d18a15aaa553c6e13ea79b1e4232b7db614c979c')
source_aarch64=("ClawX-0.4.2-linux-arm64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.4.2/ClawX-0.4.2-linux-arm64.deb")
sha512sums_aarch64=('bf2b84cd1a25d196a7cdcc44ac462e2d78110c2afd673743497596b2c95c0e699b716d83c1f95e7388c12147a0aa5bd8a5eaa086d8711f97c9900fa26eddb54b')

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
