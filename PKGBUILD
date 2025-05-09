#Maintainer:	mumi jim <echo "=02bj5yav9Gb0V3bA1Waq9VatVXb" | rev | base64 -d>


#please run "gpg --auto-key-locate nodefault,wkd --locate-keys torbrowser@torproject.org" or "curl -s https://openpgpkey.torproject.org/.well-known/openpgpkey/torproject.org/hu/kounek7zrdx745qydx6p59t9mqjpuhdf |gpg --import -" before running "makepkg"
#if you want to update without AUR. Please run "tor-browser -u"

# set -x

_appname='tor-browser'
pkgname="${_appname}-alpha-bin"
pkgver='14.5a6'
pkgrel=1
pkgdesc='Alpha Version of Tor Browser'
url='https://www.torproject.org/projects/torbrowser.html'
arch=('i686' 'x86_64')
license=('MPL-2.0')
depends=('libxt' 'startup-notification' 'mime-types' 'dbus-glib'
    'alsa-lib' 'desktop-file-utils' 'hicolor-icon-theme'
    'icu' 'libvpx' 'libevent' 'nss' 'hunspell' 'sqlite'
    'qt6-base')
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

_arch_i686='linux-i686'
_arch_x64='linux-x86_64'
_urlbase="https://dist.torproject.org/torbrowser/${pkgver}"

# check the CPU arch
_archset() {
    if [ "$CARCH" == "x86_64" ]; then
        echo -n "${_arch_x64}"
    elif [ "$CARCH" == "i686" ]; then
        echo -n "${_arch_i686}"
    fi
}

# complete sed input
_sed_escape() {
    echo "$1" | sed 's/[\/&.\*^$[]/\\&/g'
}

_checksums() {
    local _arch=$1
    (curl --silent --fail "${_urlbase}/sha256sums-signed-build.txt" ||
        curl --silent --fail "${_urlbase}/sha256sums-unsigned.txt") |
        awk -v _arch="$arch" -v pkgver="$pkgver" "/${_appname}-${_arch}-${pkgver}.tar.xz\$/"'{print $1}'
}

source_i686=("${_urlbase}/${_appname}-${_arch_i686}-${pkgver}.tar.xz"{,.asc})
source_x86_64=("${_urlbase}/${_appname}-${_arch_x64}-${pkgver}.tar.xz"{,.asc})
source=("${pkgname}.svg"
    	"${pkgname}.png"
    	"${pkgname}.desktop.in"
		"${pkgname}.in")

sha256sums=('0f05dfe54e576f45e036b3f82e079b5e87f32e3bdbbf3b31a82a5746a9277ed4'
            '1dac790ea6437642d06d5555dd636c286ab2fec3dc524b8bf08ad0f7fc2b7d3b'
            '170a0ce40874b924c8b57bda09de35c2226e3d3fe920fb985d0f1127c23da084'
            '03acb2a3a9650575df745e8899283be15357cd4ccdb507d448a80128a1c3790e')
sha256sums_i686=('39b5b857ec64e7cb213a537b8d3c8ee99659b00f29ed7a4f23354934106e96f0'
                 'SKIP')
sha256sums_x86_64=('b006919b19c7602a4c00d3ac8d2069f3c70b8ebea099c83a521bf99d24200218'
                   'SKIP')


noextract=("${_appname}-${_arch_x64}-${pkgver}.tar.xz"
    "${_appname}-${_arch_i686}-${pkgver}.tar.xz")

package() {
    cd "${srcdir}"
    # _sed_packlet = use sed to complete the source files
    local _sed_packlet="
		s/@PACKAGE_NAME@/$(_sed_escape "${pkgname}")/g
		s/@PACKAGE_VERSION@/$(_sed_escape "${pkgver}")/g
		s/@PACKAGE_RELEASE@/$(_sed_escape "${pkgrel}")/g
		s/@PACKAGE_ARCH@/$(_sed_escape "$(_archset)")/g
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

    install -Dm444 "${_appname}-$(_archset)-${pkgver}.tar.xz" "${pkgdir}/opt/${_appname}-$(_archset)-${pkgver}.tar.xz"
}
