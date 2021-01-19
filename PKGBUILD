# Maintainer: Yamada Hayao <hayao@fascode.net>

# Change this value if you want to lower the version.
_pkgver="15"
#_pkgver="13"

_extname='desktop-icons-ng'
pkgname="gnome-shell-extension-${_extname}"
_uuid="ding@rastersoft.com"
pkgver="0.${_pkgver}.0"
_latest="15"
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
		# desktop-icons-ng-0.15.0.tar.gz
		'1088b933454fb87741bf52b3650a1326c4309e8132a7ce9391c4a4362636abf0'
	)
	sha512sums+=(
		# desktop-icons-ng-0.15.0.tar.gz
		'32e8554793ab66db46aba77c2445fc77cfb6a1f9b10373adf47fa6597afc8e094d67ec4ae495a8fb7b7b0cb52158f2ce01d918a8e2a852c933fdd09380f28389'
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
