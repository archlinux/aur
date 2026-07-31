# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-bin
_pkgname=${pkgname%-bin}
pkgver="0.5.2"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents"
arch=('x86_64' 'aarch64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("ClawX-0.5.2-linux-amd64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.5.2/ClawX-0.5.2-linux-amd64.deb")
sha512sums_x86_64=('958b7ff475b7cecbd8cd9cefbc20c3005458c8ee263a6281826a630611134a74a1d00894b024d108d44b4c3a5eeba4aab39e11fdcaa248b1bdc97cac41f944f9')
source_aarch64=("ClawX-0.5.2-linux-arm64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.5.2/ClawX-0.5.2-linux-arm64.deb")
sha512sums_aarch64=('7ac1bc70d0f920b0e99d9e657317c74181ae5663085c5df73b90eb51665ee20b113eeeab342817eec0944f02dc468b65d1ffb800a35f82c596ed91acb62abca2')

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
