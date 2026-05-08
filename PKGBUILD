#Maintainer:	mumi jim <echo "=02bj5yav9Gb0V3bA1Waq9VatVXb" | rev | base64 -d>
#credit to [https://aur.archlinux.org/packages/tor-browser-bin] for providing 99% of the shit i copied over :)

#please run "gpg --auto-key-locate nodefault,wkd --locate-keys torbrowser@torproject.org" or "curl -s https://openpgpkey.torproject.org/.well-known/openpgpkey/torproject.org/hu/kounek7zrdx745qydx6p59t9mqjpuhdf |gpg --import -" before running "makepkg"
#if you want to update without AUR. Please run "tor-browser -u"

# set -x

_appname='tor-browser'
pkgname="${_appname}-alpha-bin"
pkgver='16.0a6'
pkgrel=1
pkgdesc='Alpha Version of Tor Browser'
url='https://www.torproject.org/projects/torbrowser.html'
arch=('x86_64')
license=('MPL-2.0')
depends=('libxt' 'startup-notification' 'mime-types' 'dbus-glib'
    'alsa-lib' 'desktop-file-utils' 'hicolor-icon-theme'
    'icu' 'libvpx' 'libevent' 'nss' 'hunspell' 'sqlite')
optdepends=('zenity: simple dialog boxes'
    'kdialog: KDE dialog boxes'
    'libpulse: PulseAudio audio driver'
    'gst-plugins-good: H.264 support'
    'gst-libav: H.264 support'
    'libnotify: GNOME dialog boxes')
provides=("${_appname}")
conflicts=("${_appname}")
install="${pkgname}.install"
validpgpkeys=('EF6E286DDA85EA2A4BA7DE684E2C6E8793298290')

_arch='linux-x86_64'
_urlbase="https://archive.torproject.org/tor-package-archive/torbrowser/${pkgver}"

# Make a string suitable for `sed`, by escaping `[]/&$.*^\` - syntax: `_sed_escape STRING`
_sed_escape() {
	echo "${1}" | sed 's/[]\/&.*$^[]/\\&/g'
}

_checksums() {
    local _arch=$1
    (curl --silent --fail "${_urlbase}/sha256sums-signed-build.txt" ||
        curl --silent --fail "${_urlbase}/sha256sums-unsigned.txt") |
        awk -v _arch="$arch" -v pkgver="$pkgver" "/${_appname}-${_arch}-${pkgver}.tar.xz\$/"'{print $1}'
}

source=("${pkgname}.svg"
    	"${pkgname}.png"
    	"${pkgname}.desktop.in"
		  "${pkgname}.in"
      "${_urlbase}/${_appname}-${_arch}-${pkgver}.tar.xz"{,.asc})

sha256sums=('0f05dfe54e576f45e036b3f82e079b5e87f32e3bdbbf3b31a82a5746a9277ed4'
            '1dac790ea6437642d06d5555dd636c286ab2fec3dc524b8bf08ad0f7fc2b7d3b'
            'db9f4e5ffaaf73823b9666a47becab03d502d1659d1a584d3b75196e5dd1fc46'
            '1b77a9339fc8d0d8da1b0879e347ccb3909ae7b8515c9c4b73ca0cc582ba289e'
            '2fa3338d2948f6dcf06dec80b50811c51f747fab78e72e411a6cc268bfaf6f02'
            'SKIP')

noextract=("${_appname}-${_arch}-${pkgver}.tar.xz")

package() {
    cd "${srcdir}"
    # _sed_packlet = use sed to complete the source files
    local _sed_packlet="
		s/@PACKAGE_NAME@/$(_sed_escape "${pkgname}")/g
		s/@PACKAGE_VERSION@/$(_sed_escape "${pkgver}")/g
		s/@PACKAGE_RELEASE@/$(_sed_escape "${pkgrel}")/g
		s/@PACKAGE_ARCH@/$(_sed_escape "${_arch}")/g
		"

    install -dm755 \
        "${pkgdir}/usr/bin"
    sed "${_sed_packlet}" "${pkgname}.in" > "${pkgdir}/usr/bin/${_appname}"
    chmod +x "${pkgdir}/usr/bin/${_appname}"

    # Install icon
    install -dm755 \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps"

    install -Dm644 "${srcdir}/${pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"

    install -dm755 "${pkgdir}/usr/share/applications"
    sed "${_sed_packlet}" "${pkgname}.desktop.in" > \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    install -Dm444 "${_appname}-${_arch}-${pkgver}.tar.xz" "${pkgdir}/opt/${pkgname}/${_appname}-${_arch}-${pkgver}.tar.xz"
}
