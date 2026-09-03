# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-bin
_pkgname=${pkgname%-bin}
pkgver="0.5.6"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents"
arch=('x86_64' 'aarch64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("ClawX-0.5.6-linux-amd64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.5.6/ClawX-0.5.6-linux-amd64.deb")
sha512sums_x86_64=('2d3d364b8e000cf42391a43136f8e2ba348a6e87c2965bc296d2f6758e51852cddc8453e01ac082c125b2807a69ffe896b341143391070c9708819fcef778693')
source_aarch64=("ClawX-0.5.6-linux-arm64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.5.6/ClawX-0.5.6-linux-arm64.deb")
sha512sums_aarch64=('47f98a4df0aed5578c456c972acff41a1078e09cbb574106c8fbadd138d23e1d84b7f646c3041f2db0aa399312aeee81c9bbd1c5ccb0cac2e44aceda50ebfd3c')

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
