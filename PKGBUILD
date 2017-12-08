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
pkgver=58.0b10
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

sha512sums=('93e346edc302bf25cac89c5259d91485396f61391fa3dc3fb512bd4231d9be5fb76b31d89527ebe58623fcbe62091d66596bd9413fc52874a9589a239c2d3009'
            'fa8540aa090432f554dd5b67c210d3fae0e8a03f1687964f1514e6a8c19945be9c110ae472afdbbf6c2fccffcc37e21c7d8dd994e582f50d92067c3f7f67e4ad'
            'SKIP'
            '5ec33767e4c1f1057ba33ebb5fb3497e18751fc63c7808c1c518dad1e6387484742f4dc22983b4334070a72cdb1e46614fbb574a0e7b7c522876961ead97755b'
            'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010')
