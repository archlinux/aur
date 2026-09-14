# Maintainer: Philipp Micheel <bbx0+aur at bitdevs dot de>
# Contributor: Apryse Software Inc. <support at apryse dot com>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=xodopdfreader
pkgver=2026.2.0
pkgrel=1
pkgdesc='Open, view, annotate, fill out forms, and sign PDF documents'
arch=('x86_64' 'aarch64')
url='https://xodo.com/pdf-studio/free-pdf-reader'
license=('LicenseRef-Apryse')
makedepends=('dpkg' 'desktop-file-utils' 'gendesk' 'libarchive')
# Xodo PDF Reader is the successor of PDF Studio Viewer (Qoppa -> Apryse).
#provides=('pdfstudioviewer')
#conflicts=('pdfstudioviewer')
#replaces=('pdfstudioviewer')
_deb="${pkgname}-${pkgver}_linux64.deb"
noextract=("${_deb}")
source=("${_deb}::https://getpdfstudio.xodo.com/${pkgname}/XodoPDFReader_linux64.deb")
b2sums=('34dc07644c774d40ddfda8d3d631a682b086d791dece39f9b7080bb264be5e86f6ba8515234345bf22bab175428299780c05e0127b6fee8be19261d052ee1410')

# Pin the Java version to 25 (OpenJDK). (Java versions >= 26 are not compatible.)
_jre_version=25

# Desktop File parameters; validate via `gendesk -n PKGBUILD`
_name='Xodo PDF Reader'
_genericname='PDF Viewer'
_mimetypes='application/pdf'
_categories='Office;Viewer'
# `xprop WM_CLASS` shows that the product name is used as WM_CLASS
_custom='StartupWMClass=Xodo PDF Reader'
_exec="${pkgname} %U"

pkgver() {
	# shellcheck disable=SC2016
	dpkg-deb --show --showformat='${Version}' "${_deb}" | tr - .
}

prepare() {
	# Extract Debian Archive
	dpkg-deb --raw-extract "${_deb}" "${pkgname}-${pkgver}"
	cd "${pkgname}-${pkgver}"

	# Extract the license (EULA)
	bsdtar xf "opt/${pkgname}/lib/xodopdfstudio.jar" resources/license_viewer.html

	# Arch Linux customization
	# shellcheck disable=SC1003,SC2016
	{
		# Use the newest verified compatible JRE and disable caching of tested JRE versions.
		sed -i \
			-e '/# INSTALL4J_JAVA_HOME_OVERRIDE=/a\' \
			-e ': "${INSTALL4J_JAVA_HOME_OVERRIDE:=/usr/lib/jvm/java-'${_jre_version}'-openjdk}"\' \
			-e ': "${INSTALL4J_NO_DB:=true}"' \
			"opt/${pkgname}/${pkgname}"

		# Permit the verified Java release while rejecting newer versions.
		sed -i 's/"$ver_major" -gt "[0-9]*"/"$ver_major" -gt "'${_jre_version}'"/' "opt/${pkgname}/${pkgname}"

		# Remove obsolete Java export that causes a startup warning on Java >=24.
		sed -i 's| --add-exports java.base/sun.security.action=ALL-UNNAMED||g' "opt/${pkgname}/${pkgname}"

		# Remove bundled JRE
		rm -rf "opt/${pkgname}/jre"

		# Remove standalone updater
		rm "opt/${pkgname}/update"
		rm "opt/${pkgname}/updatesh"
	}

	# Generate the ${pkgname}.desktop file
	gendesk -n \
		--pkgname "${pkgname}" \
		--pkgdesc "${pkgdesc}" \
		--name "${_name}" \
		--genericname "${_genericname}" \
		--mimetypes "${_mimetypes}" \
		--categories "${_categories}" \
		--custom "${_custom}" \
		--exec "${_exec}"
}

package() {
	cd "${pkgname}-${pkgver}"

	# Runtime dependencies
	depends=("java-runtime-openjdk=${_jre_version}" 'sane')

	# Application /opt/${pkgname}
	install -d "${pkgdir}/opt/${pkgname}"
	cp -a "opt/${pkgname}/." "${pkgdir}/opt/${pkgname}/"

	# Link /usr/bin/${pkgname}
	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# Desktop Entry and Icon
	desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "${pkgname}.desktop"
	install -Dm644 "opt/${pkgname}/.install4j/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

	# Xodo PDF Reader EULA
	install -Dm644 resources/license_viewer.html -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
