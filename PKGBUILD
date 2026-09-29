# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-bin
_pkgname=${pkgname%-bin}
pkgver="0.6.0"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents"
arch=('x86_64' 'aarch64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("ClawX-0.6.0-linux-amd64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.6.0/ClawX-0.6.0-linux-amd64.deb")
sha512sums_x86_64=('95da9fb8eb91e1234cbc946699ed3b5dbd20e4b0244c20f69159529a1bf7c9439b45c62b3acbeaac3e17149075771ae57068c727e878ecd34b484c2336d5af62')
source_aarch64=("ClawX-0.6.0-linux-arm64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.6.0/ClawX-0.6.0-linux-arm64.deb")
sha512sums_aarch64=('81c40efa550602221b182bfdf25ab384502d901576746c54a97f5d3e32c570b26c0fb1fc1497227b773b2b4d2c8cdb714954e3ef728c9e48e3b507953ba77e17')

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
