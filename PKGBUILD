# Maintainer: Yamada Hayao <hayao@fascode.net>

_pkgver="43"

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
sha256sums=('d9d603ed64f070fe64697d0ed0bce80f8b85ef05d813ded599c36b337d557910')
sha512sums=('58db77ca41856248ac4781550b0d438aec384aaa0a1037b2928feb24ba9e700f5a55b07871dcc0a35ab540014cd791920631641a3e992fd1025694a8ec815f1d')

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
