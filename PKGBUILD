# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-bin
_pkgname=${pkgname%-bin}
pkgver="0.5.8"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents"
arch=('x86_64' 'aarch64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("ClawX-0.5.8-linux-amd64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.5.8/ClawX-0.5.8-linux-amd64.deb")
sha512sums_x86_64=('13578907613c50e6fb7d5e16a92d83e7a93acfdb6c36527b9b888a09f1915412575dde60141b0922491e6149a2418e1e6338c7091d79479e6bdde4dc734a5679')
source_aarch64=("ClawX-0.5.8-linux-arm64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.5.8/ClawX-0.5.8-linux-arm64.deb")
sha512sums_aarch64=('7b1f66cb5ca8d87a9e2bcfb2260d6900c4964c9b0eb45e3e5bd03efa2a1b76d9a054639ac71b4a6cb7b8d2d27d32619585aa47d857e471b343865e4c3e513d2d')

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
