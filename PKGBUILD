# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-bin
_pkgname=${pkgname%-bin}
pkgver="0.4.1"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents"
arch=('x86_64' 'aarch64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("ClawX-0.4.1-linux-amd64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.4.1/ClawX-0.4.1-linux-amd64.deb")
sha512sums_x86_64=('1c2c020a209e39f934929496d1d3f7e5d194d2bed0fb5f7877d60736cfa015ab4a68db3ef5b4cbe7746e0ecd6afb4e52bf1c3fcb835b068ea5afb8c7185118be')
source_aarch64=("ClawX-0.4.1-linux-arm64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.4.1/ClawX-0.4.1-linux-arm64.deb")
sha512sums_aarch64=('12488be58cb79d36bf71abd19940e0a68ba45715b3d7103281d0f1424a5f26aab9e1fcd22f580167b2d0af5666c11d7afac35ef0641e718dbfa62270f7f36ed9')

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
