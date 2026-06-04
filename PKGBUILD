# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-bin
_pkgname=${pkgname%-bin}
pkgver="0.4.8"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents"
arch=('x86_64' 'aarch64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("ClawX-0.4.8-linux-amd64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.4.8/ClawX-0.4.8-linux-amd64.deb")
sha512sums_x86_64=('3c59be4e77d9c3e1c60399f4a182a19ff8c49208e6dc20f30cb270578e615e371f770207080fecbf25020fad56a13f9f1cef1e1be63d66f69ba11a5003a1583c')
source_aarch64=("ClawX-0.4.8-linux-arm64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.4.8/ClawX-0.4.8-linux-arm64.deb")
sha512sums_aarch64=('7c62b7b1b48188a23d8db5bde0b39e2882e55714878c96e6d172427fbdec5bca7130519ea26026f22eb9225234d3a0175095017cd424087abc76ea3888a45806')

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
