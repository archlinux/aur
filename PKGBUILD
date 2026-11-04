# Maintainer: czyt <czytcn@gmail.com>
pkgname=gortex-bin
pkgver=0.64.11
pkgrel=2
pkgdesc="High-performance code-intelligence engine for AI agents and IDEs, indexing repositories into a knowledge graph"
arch=('x86_64' 'aarch64')
url="https://gortex.dev"
license=('Apache-2.0')
depends=('glibc')
provides=('gortex')
conflicts=('gortex')
options=('!strip' '!debug')
source_x86_64=("gortex_linux_amd64.deb::https://github.com/zzet/gortex/releases/download/v${pkgver}/gortex_linux_amd64.deb")
source_aarch64=("gortex_linux_arm64.deb::https://github.com/zzet/gortex/releases/download/v${pkgver}/gortex_linux_arm64.deb")
sha256sums_x86_64=('4f1e73aa11153dd3a9b73dda5cd3f5190d95608176333671594cbbdf79308ce4')
sha256sums_aarch64=('475bd94649e14d9aa16f8707a5e3339867b42a0803bf0453969e5553fb9490c7')

package() {
    local _deb_x86_64="gortex_linux_amd64.deb"
    local _deb_aarch64="gortex_linux_arm64.deb"

    local _deb_var="_deb_${CARCH}"
    local _deb="${!_deb_var}"
    [[ -n "${_deb}" ]] || { echo "unsupported arch: ${CARCH}" >&2; return 1; }

    # Dynamically select the data archive member in case deb compression changes
    local _data_member
    _data_member=$(ar t "${srcdir}/${_deb}" | awk '/^data\.tar\.(gz|xz|zst|bz2|lzma)$/ { print; exit }')
    [[ -n "${_data_member}" ]] || { echo "deb has no supported data archive" >&2; return 1; }

    ar p "${srcdir}/${_deb}" "${_data_member}" |
        bsdtar --no-same-owner -xf - -C "${pkgdir}"

    chmod -R u=rwX,go=rX "${pkgdir}"
}
