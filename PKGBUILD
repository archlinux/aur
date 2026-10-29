# Maintainer: czyt <czytcn@gmail.com>
pkgname=kero-bin
pkgver=2.1.27
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
sha256sums_x86_64=('bed7e3aa9173ce6e7f2c5987e604327bfa99e7b0d154b2e81640387748692e88')
sha256sums_aarch64=('2ab0935a788581c603112375b717ea03cb6bce89677c5f41573f45bec7335d68')

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
