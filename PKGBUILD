# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-bin
_pkgname=${pkgname%-bin}
pkgver="0.4.12"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents"
arch=('x86_64' 'aarch64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("ClawX-0.4.12-linux-amd64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.4.12/ClawX-0.4.12-linux-amd64.deb")
sha512sums_x86_64=('dcbaf59b17753e54baba711db56c1914c508f45e2cbc7db85d28358b2cbcbdb0e39fd2e7b576ec77e7b1ecfed92e0eeb32516cab960e5f1397a3381cad159458')
source_aarch64=("ClawX-0.4.12-linux-arm64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.4.12/ClawX-0.4.12-linux-arm64.deb")
sha512sums_aarch64=('71a672fbb962f93e21e2e1da5446ae1e80e347cf235641e943fe337652727d0a661c19658536f6a380b22bbd32e893cd2bab07dcb8967e56ab8e1ef9cfaecb86')

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
