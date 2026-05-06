# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-bin
_pkgname=${pkgname%-bin}
pkgver="0.4.0"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents"
arch=('x86_64' 'aarch64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("ClawX-0.4.0-linux-amd64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.4.0/ClawX-0.4.0-linux-amd64.deb")
sha512sums_x86_64=('26c605636149933ce7eaf88758c29e58550d1a8b2cbaa391836c47e2fc4db3d22d8d8533c03cf5c3b5ed601e8bef58e835d69123dff94a3b32b7e21abf36dd44')
source_aarch64=("ClawX-0.4.0-linux-arm64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.4.0/ClawX-0.4.0-linux-arm64.deb")
sha512sums_aarch64=('64473c1f7e2b175e512bc45c71ee57439892083bfa8553c85500213e6f1a5bd99a9deb80b2a093f3ac663ed7da8b6e9d894b12af892b4451ea5a74f5e31720d3')

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
