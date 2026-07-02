# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-bin
_pkgname=${pkgname%-bin}
pkgver="0.4.13"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents"
arch=('x86_64' 'aarch64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("ClawX-0.4.13-linux-amd64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.4.13/ClawX-0.4.13-linux-amd64.deb")
sha512sums_x86_64=('ec0d69ddb22e5551f5b70155ae0535fc714cdc507d83c2fba3294d3d80048f4d99494eca6c081fb4b0e5a7c19d153d6586cfba378b69c4361a7c788a3686e97c')
source_aarch64=("ClawX-0.4.13-linux-arm64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.4.13/ClawX-0.4.13-linux-arm64.deb")
sha512sums_aarch64=('39c1e52d2e1aa0a9e03495eff551a179f2c1b63cb4f97986643008683ef2416f71a7dd112284e3d522b0627c25d34404b2e9309cf81846aa7d9c5435dddf66f8')

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
