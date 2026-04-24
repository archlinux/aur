# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-bin
_pkgname=${pkgname%-bin}
pkgver="0.3.11"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents"
arch=('x86_64' 'aarch64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("ClawX-0.3.11-linux-amd64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.3.11/ClawX-0.3.11-linux-amd64.deb")
sha512sums_x86_64=('baa8cf73590c8292451d20b391e9fb1de57f67f4cc88fefcedd311fb2b7857397ce689f18a248400552d2d1b435e23b36c1bc84725d45bd3d44c36663dd5c515')
source_aarch64=("ClawX-0.3.11-linux-arm64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.3.11/ClawX-0.3.11-linux-arm64.deb")
sha512sums_aarch64=('9bf3d2401fec6c32f4be0a2d29dad3b9a1ca800ec0ee9698b8dfff9de23ec3c96dc41492ecfac5547b6ea84eb0b94e558b2e919b49115c4175e518450ba9e2d2')

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
