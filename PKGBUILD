# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-bin
_pkgname=${pkgname%-bin}
pkgver="0.6.2"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents"
arch=('x86_64' 'aarch64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("ClawX-0.6.2-linux-amd64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.6.2/ClawX-0.6.2-linux-amd64.deb")
sha512sums_x86_64=('14ebfcbb486008a55cd4d3109b81110216821caea41d213b1de037a36a32484be02329d4373c3a0c2c8b58ebeace44571ede22bd71566783b1abddf1f9bb44e6')
source_aarch64=("ClawX-0.6.2-linux-arm64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.6.2/ClawX-0.6.2-linux-arm64.deb")
sha512sums_aarch64=('36bba5f9621b019209b369c3673a3aba06c22454342dd1f5db54029a1d7bd0a6d1fac1d57d3c3d04a6b9e74831f4f457a54b0e294864415019ad305d793c2b36')

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
