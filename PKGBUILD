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


pkgname='tor-browser-behind-tor'
pkgver='9.0.7'
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

	if curl --output /dev/null --silent --head --fail "${_urlbase}/tor-browser-${_archstr}-${pkgver}_${_fulllocale}.tar.xz"; then
		echo -n "${_fulllocale}"
	elif curl --output /dev/null --silent --head --fail "${_urlbase}/tor-browser-${_archstr}-${pkgver}_${_shortlocale}.tar.xz"; then
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
source_i686=("${_urlbase}/tor-browser-${_tag_i686}-${pkgver}_${_language}.tar.xz"{,.asc})
source_x86_64=("${_urlbase}/tor-browser-${_tag_x86_64}-${pkgver}_${_language}.tar.xz"{,.asc})
source=("tor-browser.desktop"
	"tor-browser.png"
	"tor-browser.sh")

### IMPORTANT #################################################################
# No need for `makepkg -g`: the following sha256sums¸don't need to be updated #
# with each release, everything is done automatically! Leave them like this!  #
###############################################################################
sha256sums=('9ee0a4672e2d0835ffb94bcf26e17b56432030496a9cdf019b70c96083c24340'
            'f25ccf68b47f5eb14c6fec0664c74f30ea9c6c58d42fc6abac3b64670aaa3152'
            '89118837e6db1d7b089e0067a6430e9a1a8602a64e00b7ea94382abfb0d3e502')
sha256sums_i686=($(_dist_checksum "${_tag_i686}")
                 'SKIP')
sha256sums_x86_64=($(_dist_checksum "${_tag_x86_64}")
                   'SKIP')

noextract=("tor-browser-${_tag_i686}-${pkgver}_${_language}.tar.xz"
           "tor-browser-${_tag_x86_64}-${pkgver}_${_language}.tar.xz")

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
		echo -e "\n  ${_COL_BBLUE_}->${_COL_DEFAULT_} ${_COL_BRED_}NOTE:${_COL_DEFAULT_} If you want to package ${_COL_BWHITE_}tor-browser${_COL_DEFAULT_} in a different language, please"
		echo -e "     set a \`${_COL_YELLOW_}TORBROWSER_PKGLANG${_COL_DEFAULT_}\` environment variable before running makepkg.\n"
		echo '     For instance:'
		echo -e "\n        ${_COL_LIGHTGREY_}TORBROWSER_PKGLANG='en-US' makepkg${_COL_DEFAULT_}\n"
	fi

	# we search and replace using sed with / as delimiter below so don't allow slashes in these vars.
	# makepkg already enforces that there're no slashes in tor-browser, so we don't check that again here.
	if [[ ${pkgver} = */* || ${_language} = */* || ${pkgdesc} = */* ]]; then
		error '${pkgver}, ${_language} and ${pkgdesc} for this package are not allowed to contain /' >&2
		return 1
	fi

}

package() {

	cd "${srcdir}"

	sed -i "s/__REPL_LANGUAGE__/${_language}/g" "tor-browser.desktop"

	sed -i "s/__REPL_NAME__/tor-browser/g"		"tor-browser.sh"
	sed -i "s/__REPL_VERSION__/${pkgver}/g"	"tor-browser.sh"
	sed -i "s/__REPL_RELEASE__/${pkgrel}/g"	"tor-browser.sh"
	sed -i "s/__REPL_LANGUAGE__/${_language}/g"	"tor-browser.sh"
	sed -i "s/__REPL_ARCH__/${_archstr}/g"		"tor-browser.sh"

	install -Dm 644 "tor-browser.desktop"		"${pkgdir}/usr/share/applications/tor-browser.desktop"
	install -Dm 644 "tor-browser.png"		"${pkgdir}/usr/share/pixmaps/tor-browser.png"
	install -Dm 755 "tor-browser.sh"		"${pkgdir}/usr/bin/tor-browser"

	install -Dm 644 "tor-browser-${_archstr}-${pkgver}_${_language}.tar.xz" "${pkgdir}/opt/tor-browser/tor-browser-${_archstr}-${pkgver}_${_language}.tar.xz"

}


