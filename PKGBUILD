# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-bin
_pkgname=${pkgname%-bin}
pkgver="0.5.5"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents"
arch=('x86_64' 'aarch64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("ClawX-0.5.5-linux-amd64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.5.5/ClawX-0.5.5-linux-amd64.deb")
sha512sums_x86_64=('326555c22d83e90918bbbece5a0175bc2c66cd9e8fa8169ae7485eb8134a966c54d0bd84d8925b78c655e24c35282a87dceae7c9ab540df378f342ce52cb7ac6')
source_aarch64=("ClawX-0.5.5-linux-arm64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.5.5/ClawX-0.5.5-linux-arm64.deb")
sha512sums_aarch64=('04a590abc6cc9ace431103bd8b5ecadd94559e34940a110a07f8d542ef9e84d9f06826a9e2290fcda91136f99c48c847012cb0a8411d844baba788a0f043d27e')

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
