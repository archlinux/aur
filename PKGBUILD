# Maintainer: Yamada Hayao <hayao@fascode.net>

# Change this value if you want to lower the version.
_pkgver="17"
#_pkgver="13"

_extname='desktop-icons-ng'
pkgname="gnome-shell-extension-${_extname}"
_uuid="ding@rastersoft.com"
pkgver="0.${_pkgver}.0"
_latest="17"
pkgrel=1
pkgdesc="A fork from the official desktop icons project, with several enhancements like Drag'n'Drop."
arch=('x86_64' 'i686')
url="https://extensions.gnome.org/extension/2087/desktop-icons-ng-ding/"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git' 'meson' 'glib2')
conflicts=("${pkgname}-git")
if [[ "${pkgver}" = "0.13.0" ]]; then
	source+=(
		"${_extname}-${pkgver}.tar.gz::https://gitlab.com/rastersoft/${_extname}/-/archive/${_pkgver}/${_extname}-${_pkgver}.tar.gz"
		#"${_extname}-${pkgver}.tar.gz::https://gitlab.com/rastersoft/desktop-icons-ng/-/archive/13/desktop-icons-ng-13.tar.gz"
	)
	sha256sums+=("SKIP")
	sha512sums+=("SKIP")
elif [[ "${_pkgver}" = "${_latest}" ]]; then
	source+=(
		"${_extname}-${pkgver}.tar.gz::https://gitlab.com/rastersoft/${_extname}/-/archive/${pkgver}/${_extname}-${pkgver}.tar.gz"
		#${_extname}-${pkgver}.tar.gz::"https://gitlab.com/rastersoft/desktop-icons-ng/-/archive/0.14.0/desktop-icons-ng-0.15.0.tar.gz"
	)
	sha256sums+=(
		# desktop-icons-ng-0.17.0.tar.gz
		'f557703d61bf87d166d0587a52416faad523df16a4be3c3e386afc445a33cb6e'
	)
	sha512sums+=(
		# desktop-icons-ng-0.17.0.tar.gz
		'7445c3f688cc37950906fbff018026623342918344f05aac96c34ea1c7fbe78731f90b98070ebbe53b9ef1b47f6ad5c91a7afdde764396d3b220e3186fb05583'
	)
else
	source+=(
		"https://gitlab.com/rastersoft/${_extname}/-/archive/${pkgver}/${_extname}-${pkgver}.tar.gz"
		#"https://gitlab.com/rastersoft/desktop-icons-ng/-/archive/0.14.0/desktop-icons-ng-0.14.0.tar.gz"
	)
	sha256sums+=("SKIP")
	sha512sums+=("SKIP")
fi


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
