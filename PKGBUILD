# Maintainer: Papajoker <papajoke [at] webstratege [dot] fr>
# Based on PKGBUILDs:
#   `firefox-developer-de` by Leo Schwarz (evotopid) <mail@leoschwarz.com>
# Pour ajouter la clé : Mozilla Software
# $ gpg --keyserver pgp.mit.edu --recv-keys 14F26682D0916CDD81E37B6D61B7B526D98F0353

_name=firefox
_channel=developer
_lang=fr

pkgname="${_name}-${_channel}-${_lang}"
pkgdesc="Standalone (${_lang}) web browser from mozilla.org, developer build - French Francais"
url='https://www.mozilla.org/fr/firefox/developer/'
pkgver=58.0b9
pkgrel=1
arch=('x86_64')
license=('MPL' 'GPL' 'LGPL')
source=("https://ftp.mozilla.org/pub/devedition/releases/$pkgver/linux-x86_64/$_lang/firefox-$pkgver.tar.bz2"
        "SHA512SUMS-$pkgver::https://ftp.mozilla.org/pub/devedition/releases/$pkgver/SHA512SUMS"
        "SHA512SUMS-$pkgver.asc::https://ftp.mozilla.org/pub/devedition/releases/$pkgver/SHA512SUMS.asc"
        "firefox-$_channel.desktop"
        "vendor.js")
depends=('alsa-lib' 'libxt' 'libnotify' 'mime-types' 'nss' 'gtk2' 'gtk3' 'sqlite' 'dbus-glib')
optdepends=(
	'pulseaudio: audio/video playback'
	'ffmpeg: h.264 video'
	'hunspell: spell checking'
	'hyphen: hyphenation'
)

provides=(firefox-developer)
conflicts=(firefox-developer)

validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353')

_verify_checksum() {
    # Check if hash of the source archive matches the one provided by Mozilla (which was signed with GPG).
    _checksum=$(grep "linux-x86_64/$_lang/firefox-$pkgver.tar.bz2" "$srcdir/SHA512SUMS-$pkgver" | cut -f1 -d " ")
    _actual=$(sha512sum "$srcdir/firefox-$pkgver.tar.bz2" | cut -f1 -d " ")

    msg2 "test de l'intégrité de firefox-$pkgver.tar.bz2"

    if [[ $_checksum == $_actual ]];
    then
        msg2 "Checksum vérification ok."
    else
        msg2 "Checksum vérification erreur!"
        exit 1
    fi
}

package() {
    _verify_checksum

    install -d $pkgdir/{usr/{bin,share/{applications,pixmaps}},opt}
    cp -r firefox "$pkgdir/opt/${_name}-${_channel}"

    ln -s /opt/firefox-$_channel/firefox "$pkgdir/usr/bin/${_name}-${_channel}"
    install -m644 $srcdir/firefox-$_channel.desktop $pkgdir/usr/share/applications/
    for i in 16 32 48; do
        install -Dm644 "${srcdir}/${_name}/browser/chrome/icons/default/default${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_name}-${_channel}.png"
    done
    install -m644 $srcdir/firefox/browser/icons/mozicon128.png "$pkgdir/usr/share/pixmaps/${_name}-${_channel}.png"
    install -Dm644 $srcdir/vendor.js "$pkgdir/opt/${_name}-${_channel}/browser/defaults/preferences/vendor.js"
}

sha512sums=('eb16f1dc3fe05a13d97e610e364bd25f2c41c480b35eae73eae0087f59b68a0a3117984d03dee42fae4e4ab944c3635d20b3ff2036d8d1a7757436375e19be69'
            '4465e2304eb9ca3b3824965c7354dfb62fa9b4da13bbc1c1d96d66217b39866456c8ac0c1eddac3c848720aa1239b2df6ac7c32d2b1a73a418578ebcc77e5345'
            'SKIP'
            '5ec33767e4c1f1057ba33ebb5fb3497e18751fc63c7808c1c518dad1e6387484742f4dc22983b4334070a72cdb1e46614fbb574a0e7b7c522876961ead97755b'
            'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010')
