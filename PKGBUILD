# Maintainer: Yamada Hayao <hayao@fascode.net>

_pkgver="20"

_extname='desktop-icons-ng'
pkgname="gnome-shell-extension-${_extname}"
_uuid="ding@rastersoft.com"
pkgver="0.${_pkgver}.0"
pkgrel=1
pkgdesc="A fork from the official desktop icons project, with several enhancements like Drag'n'Drop."
arch=('x86_64' 'i686')
url="https://extensions.gnome.org/extension/2087/desktop-icons-ng-ding/"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git' 'meson' 'glib2')
conflicts=("${pkgname}-git")

source+=(
    "${_extname}-${pkgver}.tar.gz::https://gitlab.com/rastersoft/${_extname}/-/archive/${_pkgver}/${_extname}-${_pkgver}.tar.gz"
)
sha256sums+=("88350594fc886b0afb5642b0b24a92e476b4745140feb310c21d07a5d783c23f")
sha512sums+=("b827d3ea2726bb0c738650fef34f93c0786d4a5c48fb4dca97eae7d334035a7833779e0b3aa3a344f8cd0a738bdfec43dc83b4690daab6c47320172f92bc9f33")

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
