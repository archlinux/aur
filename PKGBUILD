# Maintainer: Sundeep Mediratta <smedius@gmail.com>

_pkgver='9'

_basename='desktop-icons-ng'
_extname="gtk4-${_basename}"
_shellextension='gnome-shell-extension'
_uuid='gtk4-ding@smedius.gitlab.com'

pkgname="${_shellextension}-${_extname}"
pkgver="${_pkgver}"
pkgrel=1
pkgdesc="A Gtk4 fork from the official desktop icons project, with several enhancements for gnome shell 40, 41, 43"
arch=('x86_64' 'i686')
url="https://extensions.gnome.org/extension/5263/gtk4-desktop-icons-ng-ding"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git' 'meson' 'glib2')
conflicts=("${_shellextension}-${_basename}-git" "${_shellextension}-${_basename}")

source=("${_extname}-${pkgver}.tar.gz::https://gitlab.com/smedius/${_basename}/-/archive/${_pkgver}/${_basename}-${_pkgver}.tar.gz")
sha256sums=('f457287a91af3bfa78790cfc1b7277ee4ef7d8e330eab6c0c22a32a1602f3619')
sha512sums=('86c05ea496aa536d728991d4c6ec18333c08c1361ba9d7aebaf666a98be3b28ede128e4d189e0ae19bc546830f30c0f0981eb5d3e39df9a95f9516bf8dc33325')

package() {

    cd "${srcdir}"

    install -dm755 "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

    # taken from scripts/export-zip.sh
    if [[ -d "${_extname}-${_pkgver}"  ]]; then
        local _repodir="${srcdir}/${_basename}-${_pkgver}"
    else
        local _repodir="${srcdir}/${_basename}-${pkgver}"
    fi
    local _build_dir="${_repodir}/builddir"
    local _local_prefix="${_repodir}/${_uuid}"
    local _extension_dir="${_local_prefix}/share/gnome-shell/extensions/${_uuid}"
    local _schemadir="${_local_prefix}/share/glib-2.0/schemas"
    cp "${_repodir}/scripts/meson.build" "${_repodir}/"
    meson --prefix="${_local_prefix}" --localedir=locale "${_build_dir}" "${_repodir}"
    ninja -C "${_build_dir}" install

    cd "${_local_prefix}"
    mkdir -p schemas
    cp "${_schemadir}"/*.xml schemas/
    glib-compile-schemas schemas/
    cp -r "${_extension_dir}"/* .

    cp -dpr --no-preserve=ownership {*.js,*.json,app,utils,locale,schemas} "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

}
