# Maintainer: Philipp Micheel <bbx0+aur at bitdevs dot de>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Qoppa Software, LLC <info at qoppa dot com>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=pdfstudioviewer
_pkgname=pdfstudioviewer2024
pkgver=2024.0.1
pkgrel=2
pkgdesc='Review, annotate, and edit PDF Documents'
arch=('x86_64' 'aarch64')
url='https://www.qoppa.com/pdfstudioviewer'
license=('LicenseRef-Qoppa')
makedepends=('dpkg' 'desktop-file-utils' 'gendesk' 'libarchive')
_deb="${pkgname}-${pkgver}_linux64.deb"
noextract=("${_deb}")
source=("${_deb}::https://download.qoppa.com/${pkgname}/PDFStudioViewer_linux64.deb")
b2sums=('165ee30182fc17799604c942f1a5cfc02d9ab22dc5ad118a5f1f1394bb824000084847d720976e7caf3cac363c05c9ddbbfd2be2b1d00bb74d36307699037be5')

# Pin the Java version to 25 (OpenJDK). (Java versions >= 26 are not compatible.)
_jre_version=25

# Desktop File parameters; validate via `gendesk -n PKGBUILD`
_name='PDF Studio Viewer 2024'
_genericname='PDF Viewer'
_mimetypes='application/pdf'
_categories='Application;Office'
_custom='StartupWMClass=install4j-com-qoppa-pdfStudioViewer-pub-PDFStudioViewer'
_exec="${pkgname} %U"

pkgver() {
	# shellcheck disable=SC2016
	dpkg-deb --show --showformat='${Version}' "${_deb}" | tr - .
}

prepare() {
	# Extract Debian Archive
	dpkg-deb --raw-extract "${_deb}" "${pkgname}-${pkgver}"
	cd "${pkgname}-${pkgver}"

	# Extract License
	bsdtar xf "opt/${_pkgname}/lib/pdfstudio.jar" resources/license.html

	# Arch Linux customization
	# shellcheck disable=SC1003,SC2016
	{
		# Use the newest verified compatible JRE and disable caching of tested JRE versions.
		sed -i \
			-e '/# INSTALL4J_JAVA_HOME_OVERRIDE=/a\' \
			-e ': "${INSTALL4J_JAVA_HOME_OVERRIDE:=/usr/lib/jvm/java-'${_jre_version}'-openjdk}"\' \
			-e ': "${INSTALL4J_NO_DB:=true}"' \
			"opt/${_pkgname}/${_pkgname}"

		# Permit the verified Java release while rejecting newer versions.
		sed -i 's/"$ver_major" -gt "[0-9]*"/"$ver_major" -gt "'${_jre_version}'"/' "opt/${_pkgname}/${_pkgname}"

		# Remove obsolete Java export that causes a startup warning on Java >=24.
		sed -i 's| --add-exports java.base/sun.security.action=ALL-UNNAMED||g' "opt/${_pkgname}/${_pkgname}"

		# Remove bundled JRE
		rm -rf "opt/${_pkgname}/jre"

		# Remove standalone updater
		rm "opt/${_pkgname}/updater"
		rm "opt/${_pkgname}/pdfstudiosu"
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
	cp -a "opt/${_pkgname}/." "${pkgdir}/opt/${pkgname}/"

	# Link /usr/bin/${pkgname}
	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# Desktop Entry and Icon
	desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "${pkgname}.desktop"
	install -Dm644 "opt/${_pkgname}/.install4j/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

	# License
	install -Dm644 resources/license.html -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
