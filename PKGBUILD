# Maintainer: Sundeep Mediratta <smedius@gmail.com>

_basename='desktop-icons-ng'
_extname="gtk4-${_basename}"
_shellextension='gnome-shell-extension'
_uuid='gtk4-ding@smedius.gitlab.com'

pkgname="${_shellextension}-${_extname}"
pkgver='21'
pkgrel=1
_pkgver="Gtk4-${pkgver}"
pkgdesc="A Gtk4 fork from the official desktop icons project, with several enhancements, better multimonitor support, GSConnect integration for gnome shell 40, 41, 43"
arch=('x86_64' 'i686')
url="https://extensions.gnome.org/extension/5263/gtk4-desktop-icons-ng-ding"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git' 'meson' 'glib2')
conflicts=("${_shellextension}-${_basename}-git" "${_shellextension}-${_basename}")

source=("${_extname}-Gtk4-${pkgver}.tar.gz::https://gitlab.com/smedius/${_basename}/-/archive/Gtk4-${pkgver}/${_basename}-Gtk4-${pkgver}.tar.gz")
sha256sums=('6ab644b155fa2825421ba0ff4582cb42a5932807dd79c817319044b3e1a9176a')
sha512sums=('6880e4bc42fec1d379c764ae225cbf6298bc73bbc4542b362226528dbf0e4b23e887dd79ffb8840ad4f9993ea97dde9dfcf57f83fcfbdd15149e562a55b6b523')

package() {

    cd "${srcdir}"

    install -dm755 "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

    # taken from scripts/export-zip.sh
    local _repodir="${srcdir}/${_basename}-${_pkgver}"
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
