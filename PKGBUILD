# Maintainer: Sundeep Mediratta <smedius@gmail.com>

_basename='desktop-icons-ng'
_extname="gtk4-${_basename}"
_shellextension='gnome-shell-extension'
_uuid='gtk4-ding@smedius.gitlab.com'

pkgname="${_shellextension}-${_extname}"
pkgver='27'
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
sha256sums=('56ee8aa26aa6186cf82f7198832651f57523e69b3047ba3bc9479d34efb8341e')
sha512sums=('71ae8ceb1e9d05d2e87458610feea4baaf17fdba1b44b2ac546d23444303f750bf940450ae35422c7a3fc047cbce5959ed376593ef6a95d927a2efd68e566a4c')

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
