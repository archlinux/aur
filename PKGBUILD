# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-bin
_pkgname=${pkgname%-bin}
pkgver="0.7.0"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents"
arch=('x86_64' 'aarch64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("ClawX-0.7.0-linux-amd64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.7.0/ClawX-0.7.0-linux-amd64.deb")
sha512sums_x86_64=('11fb20652ba767a24fbaddbf2007d7a37d7da30cd211cef02f0bee8be18e006028e3bd9eeff57fb87268c59a529051ffb7cd78196e5c6400cf8898ec62a42406')
source_aarch64=("ClawX-0.7.0-linux-arm64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.7.0/ClawX-0.7.0-linux-arm64.deb")
sha512sums_aarch64=('19aa8ca851fed407cd9d4ca77c38855413b6f5e9273b8db79d00167cd8f84aa8b55650fb6fd00fb66529dd450965f3e4acbb9665088f536698d3c64552669735')

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
