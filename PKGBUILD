# Maintainer: Sundeep Mediratta <smedius@gmail.com>

_pkgver='Gtk4-13'

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
sha256sums=('8adba0b84437a8451627899bdeacfc7f67e68971f614e7e848af7a5460576271')
sha512sums=('656ba0648a2659b1267e346e875c3ec0fd3ea94a6ca0cfcda14a03b11c7a8a55bdd728b78579949dac34ee961353f1ee888124cf591d499eb86c9c6dbc79d7df')

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
