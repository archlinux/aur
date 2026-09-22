# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-bin
_pkgname=${pkgname%-bin}
pkgver="0.5.9"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents"
arch=('x86_64' 'aarch64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("ClawX-0.5.9-linux-amd64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.5.9/ClawX-0.5.9-linux-amd64.deb")
sha512sums_x86_64=('8ad6e0c514345fa449d0e6dc41aec790b085f0876f2efbb1f6932aa37c8a3b1c6040a657bd1f4c8b611eb28bad97b081bbe08cd62b45aac45f040a8440250055')
source_aarch64=("ClawX-0.5.9-linux-arm64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.5.9/ClawX-0.5.9-linux-arm64.deb")
sha512sums_aarch64=('b970059c06e084621c90188ff6906cdfde4ebf7022282a5b8f2b8b9b6e6c2ddf7d92c37c31ef25267f3fdfac72e4f172614756456c425540bad213a8d63c7325')

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
