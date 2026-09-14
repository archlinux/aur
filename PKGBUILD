# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-bin
_pkgname=${pkgname%-bin}
pkgver="0.5.7"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents"
arch=('x86_64' 'aarch64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("ClawX-0.5.7-linux-amd64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.5.7/ClawX-0.5.7-linux-amd64.deb")
sha512sums_x86_64=('f5bcb50a020beb147815815bd8359c5b701524b0f8fa8f6b47f470bd57b2fbcb8dc4154e39a5e8d96e14cb5aed1107dd5cd42415a516212432c5dfc7dee0664c')
source_aarch64=("ClawX-0.5.7-linux-arm64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.5.7/ClawX-0.5.7-linux-arm64.deb")
sha512sums_aarch64=('10f62fd85a09c46e57f73148c65dca4ace764636443e8c892f81285fea9b698f1066df37aba3d16e0577e30c18e3871651ad32210287d88507e8c1118b28319d')

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
