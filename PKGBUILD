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
pkgver=55.0b13
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
    cp -r firefox $pkgdir/opt/firefox-$_channel

    ln -s /opt/firefox-$_channel/firefox $pkgdir/usr/bin/firefox-$_channel
    install -m644 $srcdir/firefox-$_channel.desktop $pkgdir/usr/share/applications/
    install -m644 $srcdir/firefox/browser/icons/mozicon128.png $pkgdir/usr/share/pixmaps/firefox-${_channel}-icon.png
    install -Dm644 $srcdir/vendor.js $pkgdir/opt/firefox-$_channel/browser/defaults/preferences/vendor.js
}

sha512sums=('08920f76e1b79e63c3ee82f986d8d832c02ed80c4362bb0f094d1e791b01110a305130c9a8ef00087156783d090661097215fd26c9be02042e9d9cf8c7342e7f'
            '6a1fd6c3c0d991bbed23d39e06bd2d776b6c0955efbeadfb42d95b9279835cec5849d5a68e9dc618fab1694a4ec98e2bb48ec79ae089aaae63f65f56915c5375'
            'SKIP'
            '59eb730388f7d2601f40bc3c42ae203e3b65820435adfdfb18cef5d530119304762779b2e493acfdf7bcadb60e2eac3d23304dcf379a1d583d677399ba654456'
            'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010')
