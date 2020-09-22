# Maintainer: Yamada Hayao <hayao@fascode.net>

_extname='desktop-icons-ng'

_uuid="ding@rastersoft.com"

pkgname="gnome-shell-extension-${_extname}"
_pkgver="13"
pkgver="0.${_pkgver}.0"

pkgrel=1
pkgdesc="A fork from the official desktop icons project, with several enhancements like Drag'n'Drop."
arch=('x86_64' 'i686')
url="https://extensions.gnome.org/extension/2087/desktop-icons-ng-ding/"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git' 'meson' 'glib2')
conflicts=("${pkgname}-git")
source=("https://gitlab.com/rastersoft/${_extname}/-/archive/${_pkgver}/${_extname}-${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {

	cd "${srcdir}"

	install -dm755 "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"


	# Prepare _repodir
	mv "$( ls "${srcdir}" | grep "${_extname}-${_pkgver}" )" "${srcdir}/${_extname}-${pkgver}"

	# taken from export-zip.sh
	local _repodir="${srcdir}/${_extname}-${pkgver}"
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
