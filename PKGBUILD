# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-bin
_pkgname=${pkgname%-bin}
pkgver="0.7.1"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents"
arch=('x86_64' 'aarch64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("ClawX-0.7.1-linux-amd64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.7.1/ClawX-0.7.1-linux-amd64.deb")
sha512sums_x86_64=('43ff677b57b05e139758be4b8b5987c833593e2da79e226d002cf6fca694b020b61510e72149a423c91c7cc0a1827c86df89c5f9e675d9d517960d2c4f85b9fc')
source_aarch64=("ClawX-0.7.1-linux-arm64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.7.1/ClawX-0.7.1-linux-arm64.deb")
sha512sums_aarch64=('a594b873baa39abf56b86c6f3541f5d9d54e72353c2203bcd3fcf5fbf564d8d57ae812e342b371fa5264fa9b7782ebd424f0bb6bd903632685f44b2c95b47513')

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
