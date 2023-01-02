# Maintainer: Sundeep Mediratta <smedius@gmail.com>

_basename='desktop-icons-ng'
_extname="gtk4-${_basename}"
_shellextension='gnome-shell-extension'
_uuid='gtk4-ding@smedius.gitlab.com'

pkgname="${_shellextension}-${_extname}"
pkgver='28'
pkgrel=1
_pkgver="Gtk4-${pkgver}"
pkgdesc="A Gtk4 fork from the official desktop icons project, with several enhancements, better multimonitor support, GSConnect integration for gnome shell 40, 41, 43. Does a local install in the users folder"
arch=('x86_64' 'i686')
url="https://extensions.gnome.org/extension/5263/gtk4-desktop-icons-ng-ding"
license=('GPL3')
depends=('gnome-shell' 'file-roller' 'nautilus')
makedepends=('git' 'meson' 'glib2')
conflicts=("${_shellextension}-${_basename}" "${_shellextension}-${_basename}-git" "${_shellextension}-desktop-icons")
provides=("${_shellextension}-${_basename}" "${_shellextension}-${_basename}-git" "${_shellextension}-desktop-icons")

source=("${_extname}-Gtk4-${pkgver}.tar.gz::https://gitlab.com/smedius/${_basename}/-/archive/Gtk4-${pkgver}/${_basename}-Gtk4-${pkgver}.tar.gz")
sha256sums=('ebb0940f9ad0311944ed5cbe186a3f8b3e3af39805257e92197cf031ef60484e')
sha512sums=('27d0a265ff80bb5b35bb356a181ee4e1eab3ba38d2418d1a326ce79c971aaf0f150df489f6c6c33b4926def54ea198ac97b3efcafecdc7d556cfffb8b3af4e41')

package() {

    cd "${srcdir}"

    install -dm755 "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

    # taken from scripts/export-zip.sh
    local _repodir="${srcdir}/${_basename}-${_pkgver}"
    local _build_dir="${_repodir}/builddir"
    local _local_prefix="${_repodir}/${_uuid}"
    local _extension_dir="${_local_prefix}/share/gnome-shell/extensions/${_uuid}"
    local _schemadir="${_local_prefix}/share/glib-2.0/schemas"
    meson --prefix="${_local_prefix}" --localedir=locale "${_build_dir}" "${_repodir}"
    ninja -C "${_build_dir}" install

    cd "${_local_prefix}"
    mkdir -p schemas
    cp "${_schemadir}"/*.xml schemas/
    glib-compile-schemas schemas/
    cp -r "${_extension_dir}"/* .

    cp -dpr --no-preserve=ownership {*.js,*.json,app,utils,locale,schemas} "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

}
