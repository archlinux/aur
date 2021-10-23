# Maintainer: Yamada Hayao <hayao@fascode.net>

_pkgver="24"

_extname='desktop-icons-ng'
pkgname="gnome-shell-extension-${_extname}"
_uuid="ding@rastersoft.com"
#pkgver="0.${_pkgver}.0"
pkgver="${_pkgver}"
pkgrel=1
pkgdesc="A fork from the official desktop icons project, with several enhancements like Drag'n'Drop."
arch=('x86_64' 'i686')
url="https://extensions.gnome.org/extension/2087/desktop-icons-ng-ding/"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git' 'meson' 'glib2')
conflicts=("${pkgname}-git")

source=("${_extname}-${pkgver}.tar.gz::https://gitlab.com/rastersoft/${_extname}/-/archive/${_pkgver}/${_extname}-${_pkgver}.tar.gz")
sha256sums=('403da492e1507e2e204c8019a2522c633096ec25ff5152ea40e6e3079ec1dfb4')
sha512sums=('aae4a20544f5ffbcae5dd87f0233dff4f72895db6c5eba8c6c56c97a782ec8a774a355af55cde6c42754c9267aa8d905e3ed718c47d4b307ab02ff50b382a537')

package() {

    cd "${srcdir}"

    install -dm755 "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

    # taken from export-zip.sh
    if [[ -d "${_extname}-${_pkgver}"  ]]; then
        local _repodir="${srcdir}/${_extname}-${_pkgver}"
    else
        local _repodir="${srcdir}/${_extname}-${pkgver}"
    fi
    local _build_dir="${_repodir}/builddir"
    local _local_prefix="${_repodir}/${_uuid}"
    local _extension_dir="${_local_prefix}/share/gnome-shell/extensions/${_uuid}"
    local _schemadir="${_local_prefix}/share/glib-2.0/schemas"
    meson --prefix="${_local_prefix}" --localedir=locale "${_build_dir}" "${_repodir}"
    ninja -C "${_build_dir}" install

    cd "${_local_prefix}"
    mkdir schemas
    cp "${_schemadir}"/*.xml schemas/
    glib-compile-schemas schemas/
    cp -r "${_extension_dir}"/* .

    cp -dpr --no-preserve=ownership {*.js,*.css,*.json,locale,schemas} "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

}
