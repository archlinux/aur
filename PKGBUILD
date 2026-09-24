# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_apptitle='firmaOK'
_pkgsuffx='Linux'
_appname="${_apptitle,,}"
pkgname="${_appname}-bin"
pkgver='1.6.31'
pkgrel=1
pkgdesc='Digital signature app by the Italian Poste company'
arch=('any')
url='https://postecert.poste.it/firma/newfirmaok.shtml'
license=('custom:firmaok')
provides=("${_appname}")
conflicts=("${pkgname}-git" "${pkgname}-bin")
depends=('hicolor-icon-theme' 'bash' 'qt5-base' 'openssl' 'python' 'gnome-keyring' 'curl')
source=("https://postecert.poste.it/firma/download/${_appname}setup/${_apptitle}_${_pkgsuffx}.tar.gz"
        "${_appname}.in"
        'Licenza.pdf'
        "${_appname}.desktop"
        "${_appname}.png"
        "${_appname}.svg"
        'pen.svg')
sha512sums=('3306bf0a2aa139e10162cbfc3011e3819e6d654d1e71187f061b8df7eccf06360893dbb39e5af5fb5066646cad933f9ea7b0ca1cdb6f11b1a9283c99aa6b94b9'
            '3e346a536fd7bde9074dd0b8b9d52f35cf3e5debdb79c7263a275952f7ea6d85320588a206d35ebdea6404a9c440725eee352e0bb915e51be6c6aafb18132aae'
            '9189dbcd9f123c5a929952d657d71766cda45fdb0aec7453387b014fb72fe6a04e02976e18071f2194aad4bef883dc6ee0f054df4510e6e51fe91495d0ea97fd'
            'a50a6b93c2f757a496616e8a217b5dc1b83802fffa800c9778e5d060303aea5e72148c2907ffab7fe26c782ba470847e2ddace0ffd16f8a7f4eeb1b049427c92'
            '5a1f0e0674ced7dd5fb44732ea9b2c2156531383a20d4b469768a6c052f9271b7e51073eb38c9af62d9091f4da9cb5f73fc9a068510a8d34cc429e80ced03077'
            '8e46cf58a42dc279dc4c6ed307afcc4897197cce6f07e630d4bdd42d34cb31866a5a365d7bd1ed277dcf598bb22271f2a6b8335456b338b70b3df33b1b44fd94'
            '6a2004c3afa3d10991fbb748c9aaef648cab1c0e06c6af444f65f3b17f959701743ac8f95cbc2a71f0a35ef69fd65e7da566a7d20c151582abfd31a125a73f53')
options=('!strip')
noextract=("${_apptitle}_${_pkgsuffx}.tar.gz")
install="${_appname}.install"

# Make a string suitable for `sed`, by escaping `[]/&$.*^\` - syntax: `_sed_escape STRING`
_sed_escape() {
	echo "${1}" | sed 's/[]\/&.*$^[]/\\&/g'
}

package() {

	cd "${srcdir}"

	local _sed_subst="
		s/@PACKAGE_NAME@/$(_sed_escape "${pkgname}")/g
		s/@PACKAGE_VERSION@/$(_sed_escape "${pkgver}")/g
		s/@APP_NAME@/$(_sed_escape "${_appname}")/g
		s/@PACKAGE_RELEASE@/$(_sed_escape "${pkgrel}")/g
		s/@PACKAGE_TITLE@/$(_sed_escape "${_apptitle}")/g
		s/@PACKAGE_SUFFIX@/$(_sed_escape "${_srcsuffx}")/g
	"

	install -dm755 "${pkgdir}/usr/bin"
	sed "${_sed_subst}" "${_appname}.in" > "${pkgdir}/usr/bin/${_appname}"
	chmod +x "${pkgdir}/usr/bin/${_appname}"

	install -dm755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
	install -Dm644 "${srcdir}/${_appname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/firmaok.png"

	install -dm755 "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"
	install -Dm644 "${srcdir}/${_appname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/firmaok.png"

	install -dm755 "${pkgdir}/opt/${_appname}"
	install -Dm644 "${srcdir}/firmaOK_Linux.tar.gz" "${pkgdir}/opt/${_appname}/${pkgname}-${pkgver}.tar.gz"
	install -Dm644 "${srcdir}/pen.svg" "${pkgdir}/opt/${_appname}/pen.svg"

	install -dm755 "${pkgdir}/usr/share/applications/"
	install -Dm644 "${srcdir}/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"

	install -dm755 "${pkgdir}/usr/share/licenses/${_appname}/"
	install -Dm644 "${srcdir}/Licenza.pdf" "${pkgdir}/usr/share/licenses/${_appname}/licenza.pdf"

}

