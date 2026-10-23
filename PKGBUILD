# Maintainer: czyt <czytcn@gmail.com>
# Ely Office desktop apps. Named *-app-bin because the standard ely-*-bin
# names are already taken on AUR by another maintainer.
pkgname=ely-doc-app-bin
pkgver=0.1.11
pkgrel=1
pkgdesc="ElyDoc - Word document editor from the Ely Office suite"
arch=('x86_64')
url="https://office.elygpui.com"
license=('MIT')
depends=('glibc' 'gcc-libs' 'dbus' 'libxkbcommon' 'libxkbcommon-x11' 'libxcb')
optdepends=('vulkan-icd-loader: GPU accelerated rendering' 'wayland: Wayland session support')
provides=('ely-doc')
conflicts=('ely-doc' 'ely-doc-bin')

options=('!strip' '!debug')
source_x86_64=("ely-doc_${pkgver}-1_amd64.deb::https://github.com/ELY-Open-Source/ElyOffice/releases/download/v${pkgver}/ely-doc_${pkgver}-1_amd64.deb")
sha256sums_x86_64=('b0fc492369740d8d6b3cfc801024d4b156a8b737e7c77726c5990ed7a163acf7')

package() {
    local _deb="ely-doc_${pkgver}-1_amd64.deb"

    local _data_member
    _data_member=$(ar t "${srcdir}/${_deb}" | awk '/^data\.tar\.(gz|xz|zst|bz2|lzma)$/ { print; exit }')
    [[ -n "${_data_member}" ]] || { echo "deb has no supported data archive" >&2; return 1; }

    ar p "${srcdir}/${_deb}" "${_data_member}" |
        bsdtar --no-same-owner -xf - -C "${pkgdir}"

    chmod -R u=rwX,go=rX "${pkgdir}"
}
