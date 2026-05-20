# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-bin
_pkgname=${pkgname%-bin}
pkgver="0.4.6"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents"
arch=('x86_64' 'aarch64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("ClawX-0.4.6-linux-amd64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.4.6/ClawX-0.4.6-linux-amd64.deb")
sha512sums_x86_64=('30ed307c279d5735355ea81e85035865764df186f5c642be709589c254139d2b350646496f20eec941386e8abaec9c34e619f4ed9bbf0ecfdcc7ea901f799009')
source_aarch64=("ClawX-0.4.6-linux-arm64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.4.6/ClawX-0.4.6-linux-arm64.deb")
sha512sums_aarch64=('a6cbcb2784b02b400c5a1a6d9a28765e424e1275960a43e0ebc6b2b6860369f9d0136baaa3fcf0e9adbb7eb861ff5c717c8ab6e7643ef5ce79473c005884e081')

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
