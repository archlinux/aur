
# Maintainer: Evgeniy Kaa <genues@mail.ru>
# Based on PKGBUILDs: 'firefox-developer-de' by Leo Schwarz (evotopid) <mail@leoschwarz.com>
#
# Не забудьте добавить ключ:
# $ gpg --keyserver pgp.mit.edu --recv-keys 14F26682D0916CDD81E37B6D61B7B526D98F0353

_name=firefox
_channel=developer
_lang=ru

pkgname="${_name}-${_channel}-ru"
pkgdesc='Standalone web browser from mozilla.org, developer build - Russian'
url='http://www.mozilla.org/firefox/developer'
pkgver=57.0b13
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
    _checksum=`grep "linux-x86_64/$_lang/firefox-$pkgver.tar.bz2" "$srcdir/SHA512SUMS-$pkgver" | cut -f1 -d " "`
    _actual=`sha512sum $srcdir/firefox-$pkgver.tar.bz2 | cut -f1 -d " "`

    msg2 "Checking integrity of firefox-$pkgver.tar.bz2"

    if [[ $_checksum == $_actual ]];
    then
        msg2 "Checksum verified successfully."
    else
        msg2 "Checksum verification failed!"
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

sha512sums=('0f7655a3f0f290a14027305916b7c4a73a2292e6140677cca137bbd9417473a9c286807f8279dc3e6d723af2c142bdd958f68c748a48fa42b8d0dcc5f88d9407'
            'af800e0ecc636a98d5228ad1bccdfc471a69755a40cf0c5d68e192a60d52c3885b1cad305bbb8187bb208d0b2d1637a7c73cb24a66e0e476e66965b9ead3e71c'
            '90c42f697267c0226afcebc6745138cc71dff92b2f0cbf40d68d99b384fa3037aa79858e73a8d2c2ea852e7a70d6c653e83c34074a6bfcf27b8bd1cabbf82d52'
            '9075e0d67e4dc153dcf514f3aa2b2415ce8b39275eedbf02a3cd122949b95bf4af9dad358516145decf445d1a903d52a634f4eeeb44bb67864de02e646a76631'
            'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010')
