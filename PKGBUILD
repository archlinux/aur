# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-bin
_pkgname=${pkgname%-bin}
pkgver="0.5.0"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents"
arch=('x86_64' 'aarch64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("ClawX-0.5.0-linux-amd64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.5.0/ClawX-0.5.0-linux-amd64.deb")
sha512sums_x86_64=('b763a21e5f0e1a8c3de7c57800c969c3710741c2c8fe567383f8597f4b6a5baaacae0c880054ab1374a98d06ac37862b89bf55bfe0ee0a225c21a81acb7a7f78')
source_aarch64=("ClawX-0.5.0-linux-arm64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.5.0/ClawX-0.5.0-linux-arm64.deb")
sha512sums_aarch64=('5c63abb8e8f7923516a81704acf7bd06a643a4804bc2d09880eca1dc66378b4cb111c7746f36dd506e610d23e1e32d790a37e67a3949afaed0f9d764006c1f04')

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
