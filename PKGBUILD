# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-bin
_pkgname=${pkgname%-bin}
pkgver="0.4.11"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents"
arch=('x86_64' 'aarch64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("ClawX-0.4.11-linux-amd64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.4.11/ClawX-0.4.11-linux-amd64.deb")
sha512sums_x86_64=('4375974b2f7e19d33f63238eba022b02ce35bd5675a1a203378085865ab5a7afe60759708381952ec047c50765e9508f4af99c4b8d57ddc4a775291eb9670ca1')
source_aarch64=("ClawX-0.4.11-linux-arm64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.4.11/ClawX-0.4.11-linux-arm64.deb")
sha512sums_aarch64=('dbefab2cbf945e1c9830fe766419e3bb0a09db5d4ed2a4313b3b8276e1dd05b535694bcda84f64ee6b3ff138c947c95d00331d22f789d4f19bc2dc257155022e')

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
