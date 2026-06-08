# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-bin
_pkgname=${pkgname%-bin}
pkgver="0.4.9"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents"
arch=('x86_64' 'aarch64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("ClawX-0.4.9-linux-amd64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.4.9/ClawX-0.4.9-linux-amd64.deb")
sha512sums_x86_64=('d79a0d39bc7fe72689878757d82c79b24209c86450760be7c5ffbb579dafdcf8728b259457b3ebaac3935951573e2a90b18616ddf1f44d5da50b682184d24b40')
source_aarch64=("ClawX-0.4.9-linux-arm64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.4.9/ClawX-0.4.9-linux-arm64.deb")
sha512sums_aarch64=('9e6120abd9e7ab5456394e5ff6e982b89a0702b8a4e5e8561e2edbe67461de54279b89b647b6e36f67a894c86eb54bc849668209ccefe5a9ac6e24533f91b1a7')

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
