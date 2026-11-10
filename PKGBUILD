# Maintainer: czyt <czytcn@gmail.com>

pkgname=opendj-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Free, open-source DJ software: decks, stems, effects and controllers"
arch=('x86_64')
url="https://opendj.app"
license=('GPL-2.0-or-later')
depends=(
    'alsa-lib'
    'fontconfig'
    'gcc-libs'
    'glibc'
    'hicolor-icon-theme'
    'libxkbcommon'
    'systemd-libs'
)
optdepends=(
    'libx11: X11 windowing'
    'libxkbcommon-x11: X11 keyboard layout support'
    'vulkan-icd-loader: Vulkan rendering backend'
    'vulkan-intel: Vulkan driver for Intel GPUs'
    'vulkan-radeon: Vulkan driver for AMD GPUs'
    'vulkan-swrast: software Vulkan fallback'
    'wayland: native Wayland windowing'
)
provides=('opendj')
conflicts=('opendj')
options=('!strip' '!debug')

_deb="opendj_${pkgver}_amd64.deb"
source_x86_64=("${_deb}::https://github.com/sebastian-beca/opendj/releases/download/v${pkgver}/${_deb}")
noextract=("${_deb}")
sha256sums_x86_64=('ad00cbda69e4228e6c1ee1c472d5e7ad18b4a02bd6ba023d085d3236df1c3994')

package() {
    local _data_member
    _data_member=$(ar t "${srcdir}/${_deb}" |
        awk '/^data\.tar\.(gz|xz|zst|bz2|lzma)$/ { print; exit }')
    [[ -n "${_data_member}" ]] || { echo "deb has no supported data archive" >&2; return 1; }

    # The deb already uses standard paths (binary in /usr/bin, mappings in
    # /usr/share/opendj, udev rules in /usr/lib/udev), so it unpacks as-is.
    ar p "${srcdir}/${_deb}" "${_data_member}" |
        bsdtar --no-same-owner -xf - -C "${pkgdir}"

    install -Dm644 "${pkgdir}/usr/share/doc/opendj/copyright" \
        "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    install -Dm644 "${pkgdir}/usr/share/doc/opendj/NOTICE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
    rm -r "${pkgdir}/usr/share/doc"

    chmod -R u=rwX,go=rX "${pkgdir}"
    chown -R root:root "${pkgdir}"
}
