# Maintainer: czyt <czytcn@gmail.com>
pkgname=kero-bin
pkgver=2.1.19
pkgrel=1
pkgdesc="Cross-platform native terminal app optimized for agents"
arch=('x86_64' 'aarch64')
url="https://kero.sh"
license=('MIT')
# The Go binary links only libc; GTK3/WebKitGTK are loaded at runtime for the UI.
depends=('gtk3' 'webkit2gtk-4.1')
provides=('kero')
conflicts=('kero')
options=('!strip' '!debug')
source_x86_64=("kero_${pkgver}_amd64.deb::https://github.com/egoist/kero/releases/download/v${pkgver}/kero_${pkgver}_amd64.deb")
source_aarch64=("kero_${pkgver}_arm64.deb::https://github.com/egoist/kero/releases/download/v${pkgver}/kero_${pkgver}_arm64.deb")
sha256sums_x86_64=('119d426c72006ac80325a16d6aed50331910cad08384b993a1aa5428b3f15ab1')
sha256sums_aarch64=('0a32f5b3210ac03218477d93e5b6340b9e1c6368a640808f8fe9e0f7551029bb')

package() {
    local _deb_x86_64="kero_${pkgver}_amd64.deb"
    local _deb_aarch64="kero_${pkgver}_arm64.deb"

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

    # Expose the app in PATH (upstream desktop file points at /opt/kero/kero)
    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/kero/kero "${pkgdir}/usr/bin/kero"
}
