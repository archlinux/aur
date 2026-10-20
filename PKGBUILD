# Maintainer: czyt <czytcn@gmail.com>
# Ely Office desktop apps. Named *-app-bin because the standard ely-*-bin
# names are already taken on AUR by another maintainer.
pkgname=ely-mark-app-bin
pkgver=0.1.9
pkgrel=1
pkgdesc="ElyMark - Markdown editor from the Ely Office suite"
arch=('x86_64')
url="https://office.elygpui.com"
license=('MIT')
depends=('glibc' 'gcc-libs' 'dbus' 'libxkbcommon' 'libxkbcommon-x11' 'libxcb')
optdepends=('vulkan-icd-loader: GPU accelerated rendering' 'wayland: Wayland session support')
provides=('ely-mark')
conflicts=('ely-mark' 'ely-mark-bin')

options=('!strip' '!debug')
source_x86_64=("ely-mark_${pkgver}-1_amd64.deb::https://github.com/ELY-Open-Source/ElyOffice/releases/download/v${pkgver}/ely-mark_${pkgver}-1_amd64.deb")
sha256sums_x86_64=('0f07ae95ccc2906f99112fd14615390fd77bcdcb87184dd12e41efd164b80f8c')

package() {
    local _deb="ely-mark_${pkgver}-1_amd64.deb"

    local _data_member
    _data_member=$(ar t "${srcdir}/${_deb}" | awk '/^data\.tar\.(gz|xz|zst|bz2|lzma)$/ { print; exit }')
    [[ -n "${_data_member}" ]] || { echo "deb has no supported data archive" >&2; return 1; }

    ar p "${srcdir}/${_deb}" "${_data_member}" |
        bsdtar --no-same-owner -xf - -C "${pkgdir}"

    chmod -R u=rwX,go=rX "${pkgdir}"
}
