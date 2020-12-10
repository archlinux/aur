# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: midgard <arch.midgard AT janmaes DOT com> 
# Contributor: TrialnError <autumn-wind AT web DOT de>
# Contributor: Yardena Cohen <yardenack AT gmail DOT com>
# Contributor: Max Roder <maxroder AT web DOT de>
# Contributor: Sebastian Jug <seb AT stianj DOT ug>
# Contributor: BrLi
#
# Before running makepkg, you must do this (as normal user):
#
#     gpg --auto-key-locate nodefault,wkd --locate-keys torbrowser@torproject.org
#
# If you want to update tor-browser from AUR without AUR helpers you can run in a terminal:
#
#     tor-browser -u


_pkgname='tor-browser'
pkgname='tor-browser-behind-tor'
pkgver='10.0.6'
pkgrel='1'
pkgdesc='Tor Browser Bundle: anonymous browsing using Firefox and Tor (international PKGBUILD) (using tor service to download sources)'
url='https://www.torproject.org/projects/torbrowser.html'
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('tor')
depends=('mozilla-common' 'libxt' 'startup-notification' 'mime-types'
	'dbus-glib' 'alsa-lib' 'desktop-file-utils' 'hicolor-icon-theme'
	'libvpx' 'icu' 'libevent' 'nss' 'hunspell' 'sqlite')
optdepends=('zenity: simple dialog boxes'
	'kdialog: KDE dialog boxes'
	'gst-plugins-good: H.264 video'
	'gst-libav: H.264 video'
	'libpulse: PulseAudio audio driver'
	'libnotify: Gnome dialog boxes')
install="tor-browser.install"

_tag_i686='linux32'
_tag_x86_64='linux64'
_urlbase="https://dist.torproject.org/torbrowser/${pkgver}"
_archstr=$([[ "${CARCH}" == 'x86_64' ]] && echo -n "${_tag_x86_64}" || echo -n "${_tag_i686}")
export all_proxy="socks5h://127.0.0.1:9050"
_localetor() {

	#
	# Checking if a `tor-browser` package exists for current locale; a different language can be
	# chosen by giving a `TORBROWSER_PKGLANG` environment variable to `makepkg`, for instance:
	#
	#	TORBROWSER_PKGLANG='en-US' makepkg
	#

	if [[ -n "${TORBROWSER_PKGLANG}" ]]; then
		echo -n "${TORBROWSER_PKGLANG}"
		return 0
	fi

	local _fulllocale="$(locale | grep LANG | cut -d= -f2 | cut -d. -f1 | sed s/_/\-/)"
	local _shortlocale="$(locale | grep LANG | cut -d= -f2 | cut -d_ -f1)"

	if curl --output /dev/null --silent --head --fail "${_urlbase}/${_pkgname}-${_archstr}-${pkgver}_${_fulllocale}.tar.xz"; then
		echo -n "${_fulllocale}"
	elif curl --output /dev/null --silent --head --fail "${_urlbase}/${_pkgname}-${_archstr}-${pkgver}_${_shortlocale}.tar.xz"; then
		echo -n "${_shortlocale}"
	else
		echo -n 'en-US'
	fi

}

_language="$(_localetor)"

validpgpkeys=('EF6E286DDA85EA2A4BA7DE684E2C6E8793298290')

# Syntax: _dist_checksum 'linux32'/'linux64'
_dist_checksum() {

	curl --silent --fail "${_urlbase}/sha256sums-signed-build.txt" | grep "${1}-${pkgver}_${_language}.tar.xz" | cut -d ' ' -f1

}

source_i686=("${_urlbase}/${_pkgname}-${_tag_i686}-${pkgver}_${_language}.tar.xz"{,.asc})
source_x86_64=("${_urlbase}/${_pkgname}-${_tag_x86_64}-${pkgver}_${_language}.tar.xz"{,.asc})

# Make a string suitable for `sed`, by escaping `[]/&$.*^\` - syntax: `_sed_escape STRING`
_sed_escape() {
	echo "${1}" | sed 's/[]\/&.*$^[]/\\&/g'
}

source=("tor-browser.desktop.in"
	"tor-browser.in"
	"tor-browser.png"
	"tor-browser.svg")

sha256sums=('0b0614d04d55ac3748775fd34cb6c1f244fd05b5a16cc1e3ae70d887f7eedbc6'
            '8a6e0945571c332c1fc8b1cef11d15f699a752da2bb403bd0b65ee44821cc643'
            'f25ccf68b47f5eb14c6fec0664c74f30ea9c6c58d42fc6abac3b64670aaa3152'
            '7b28b5dbe8ad573bb46e61b4d542b33e01ca240825ca640b4893fee6203b021f')
sha256sums_i686=('66b03799031001230fa34eb00d3e65fbaf7b451be32ba775daf54aad1a001316'
                 'SKIP')
sha256sums_x86_64=('24a13ad7b26e01ed9995240594427f23938d94204d1546f9ec53b3d559de8edd'
                   'SKIP')

noextract=("${_pkgname}-${_tag_i686}-${pkgver}_${_language}.tar.xz"
           "${_pkgname}-${_tag_x86_64}-${pkgver}_${_language}.tar.xz")

prepare() {

	# use colors only if we have them
	if [[ $(which tput > /dev/null 2>&1 && tput -T "${TERM}" colors || echo -n '0') -ge 8 ]] ; then
		local _COL_YELLOW_='\e[0;33m'
		local _COL_LIGHTGREY_='\e[0;37m'
		local _COL_BRED_='\e[1;31m'
		local _COL_BBLUE_='\e[1;34m'
		local _COL_BWHITE_='\e[1;37m'
		local _COL_DEFAULT_='\e[0m'
	fi

	msg "Packaging tor-browser (language: ${_language})..."

	if [[ -z "${TORBROWSER_PKGLANG}" ]]; then
		echo -e "\n  ${_COL_BBLUE_}->${_COL_DEFAULT_} ${_COL_BRED_}NOTE:${_COL_DEFAULT_} If you want to package ${_COL_BWHITE_}${_pkgname}${_COL_DEFAULT_} in a different language, please"
		echo -e "     set a \`${_COL_YELLOW_}TORBROWSER_PKGLANG${_COL_DEFAULT_}\` environment variable before running makepkg.\n"
		echo '     For instance:'
		echo -e "\n        ${_COL_LIGHTGREY_}TORBROWSER_PKGLANG='en-US' makepkg${_COL_DEFAULT_}\n"
	fi

}

package() {

	cd "${srcdir}"

	local _sed_subst="
		s/@PACKAGE_NAME@/$(_sed_escape "${_pkgname}")/g
		s/@PACKAGE_VERSION@/$(_sed_escape "${pkgver}")/g
		s/@PACKAGE_RELEASE@/$(_sed_escape "${pkgrel}")/g
		s/@PACKAGE_LANGUAGE@/$(_sed_escape "${_language}")/g
		s/@PACKAGE_ARCH@/$(_sed_escape "${_archstr}")/g
	"

	install -dm755 "${pkgdir}/usr/bin"
	sed "${_sed_subst}" "${_pkgname}.in" > "${pkgdir}/usr/bin/${_pkgname}"
	chmod +x "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm 644 "${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

	install -Dm 644 "${_pkgname}.svg" "${pkgdir}/usr/share/pixmaps/${_pkgname}.svg"

	install -dm755 "${pkgdir}/usr/share/applications"
	sed "${_sed_subst}" "${_pkgname}.desktop.in" > \
		"${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	install -Dm 644 "${_pkgname}-${_archstr}-${pkgver}_${_language}.tar.xz" \
		"${pkgdir}/opt/${_pkgname}/${_pkgname}-${_archstr}-${pkgver}_${_language}.tar.xz"

}


