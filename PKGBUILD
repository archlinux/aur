# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Maintainer: Sebastian Jug <seb AT stianj DOT ug>
# Contributor: midgard <arch.midgard AT janmaes DOT com>
# Contributor: TrialnError <autumn-wind AT web DOT de>
# Contributor: Yardena Cohen <yardenack AT gmail DOT com>
# Contributor: Max Roder <maxroder AT web DOT de>
# Contributor: BrLi

#
# Before running makepkg, you must do this (as normal user):
#
#     gpg --auto-key-locate nodefault,wkd --locate-keys torbrowser@torproject.org
#
# If you want to update tor-browser from AUR without AUR helpers you can run in a terminal:
#
#     tor-browser -u


_appname='tor-browser'
pkgname="${_appname}-bin"
pkgver='13.0.5'
pkgrel=1
pkgdesc='Tor Browser Bundle: anonymous browsing using Firefox and Tor'
url='https://www.torproject.org/projects/torbrowser.html'
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxt' 'startup-notification' 'mime-types' 'dbus-glib'
	'alsa-lib' 'desktop-file-utils' 'hicolor-icon-theme'
	'libvpx' 'icu' 'libevent' 'nss' 'hunspell' 'sqlite')
optdepends=('zenity: simple dialog boxes'
	'kdialog: KDE dialog boxes'
	'gst-plugins-good: H.264 video'
	'gst-libav: H.264 video'
	'libpulse: PulseAudio audio driver'
	'libnotify: Gnome dialog boxes')
provides=("${_appname}")
conflicts=("${_appname}")
install="${_appname}.install"
validpgpkeys=('EF6E286DDA85EA2A4BA7DE684E2C6E8793298290')

_tag_i686='linux-i686'
_tag_x86_64='linux-x86_64'
_urlbase="https://dist.torproject.org/torbrowser/${pkgver}"
_archstr=$([[ "${CARCH}" == 'x86_64' ]] && echo -n "${_tag_x86_64}" || echo -n "${_tag_i686}")

# Syntax: _dist_checksum 'linux-i686'/'linux-x86_64'
_dist_checksum() {

	(curl --silent --fail "${_urlbase}/sha256sums-signed-build.txt" || \
		curl --silent --fail "${_urlbase}/sha256sums-unsigned-build.txt") | \
		awk "/${_appname}-${1}-${pkgver}.tar.xz$/"'{print $1}'

}

# Make a string suitable for `sed`, by escaping `[]/&$.*^\` - syntax: `_sed_escape STRING`
_sed_escape() {
	echo "${1}" | sed 's/[]\/&.*$^[]/\\&/g'
}

source_i686=("${_urlbase}/${_appname}-${_tag_i686}-${pkgver}.tar.xz"{,.asc})
source_x86_64=("${_urlbase}/${_appname}-${_tag_x86_64}-${pkgver}.tar.xz"{,.asc})
source=("${_appname}.desktop.in"
	    "${_appname}.in"
	    "${_appname}.png"
	    "${_appname}.svg")

### IMPORTANT #################################################################
# No need for `makepkg -g`: the following sha256sums¸don't need to be updated #
# with each release, everything is done automatically! Leave them like this!  #
###############################################################################
sha256sums=('5dd2b61bd4edf4d1499a81127f97a1de7ec272a885df97331b61969a5a07f05f'
            '1313484fc0572d82067f5671327540fcab6747fd2d187f216e1fc8edf3581509'
            'f25ccf68b47f5eb14c6fec0664c74f30ea9c6c58d42fc6abac3b64670aaa3152'
            '7b28b5dbe8ad573bb46e61b4d542b33e01ca240825ca640b4893fee6203b021f')
sha256sums_i686=("$(_dist_checksum "${_tag_i686}")"
                 'SKIP')
sha256sums_x86_64=("$(_dist_checksum "${_tag_x86_64}")"
                   'SKIP')

noextract=("${_appname}-${_tag_i686}-${pkgver}.tar.xz"
           "${_appname}-${_tag_x86_64}-${pkgver}.tar.xz")

package() {

	cd "${srcdir}"

	local _sed_subst="
		s/@PACKAGE_NAME@/$(_sed_escape "${_appname}")/g
		s/@PACKAGE_VERSION@/$(_sed_escape "${pkgver}")/g
		s/@PACKAGE_RELEASE@/$(_sed_escape "${pkgrel}")/g
		s/@PACKAGE_ARCH@/$(_sed_escape "${_archstr}")/g
	"

	install -dm755 "${pkgdir}/usr/bin"
	sed "${_sed_subst}" "${_appname}.in" > "${pkgdir}/usr/bin/${_appname}"
	chmod +x "${pkgdir}/usr/bin/${_appname}"

	install -dm755 \
		"${pkgdir}/usr/share/icons/hicolor/scalable/apps" \
		"${pkgdir}/usr/share/icons/hicolor/128x128/apps"

	install -Dm644 "${srcdir}/${_appname}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_appname}.png"
	install -Dm644 "${srcdir}/${_appname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_appname}.svg"

	install -dm755 "${pkgdir}/usr/share/applications"
	sed "${_sed_subst}" "${_appname}.desktop.in" > \
		"${pkgdir}/usr/share/applications/${_appname}.desktop"

	install -Dm444 "${_appname}-${_archstr}-${pkgver}.tar.xz" \
		"${pkgdir}/opt/${_appname}/${_appname}-${_archstr}-${pkgver}.tar.xz"

}


