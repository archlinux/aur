# Maintainer: Leo Schwarz (evotopid) <mail@leoschwarz.com>
# Based on PKGBUILDs:
# • `firefox-developer` by John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# • `firefox-developer-es-mx` by Icaro Perseo <icaroperseo[at]protonmail[dot]com>
#
# Hinweis: Es ist notwendig den PGP Schlüssel von "Mozilla Software Releases <release@mozilla.com>"
#   zu importieren. Mehr Information unter: https://wiki.archlinux.org/index.php/GnuPG#Import_a_public_key
#   $ gpg --keyserver pgp.mit.edu --recv-keys 14F26682D0916CDD81E37B6D61B7B526D98F0353

_name=firefox
_channel=developer
_lang=de

pkgname="${_name}-${_channel}-de"
pkgdesc='Standalone web browser from mozilla.org, developer build - German'
url='http://www.mozilla.org/firefox/developer'
pkgver=55.0b1
pkgrel=1
arch=('x86_64')
license=('MPL' 'GPL' 'LGPL')
source=("https://ftp.mozilla.org/pub/devedition/releases/$pkgver/linux-x86_64/$_lang/firefox-$pkgver.tar.bz2"
        "https://ftp.mozilla.org/pub/devedition/releases/$pkgver/SHA512SUMS"
        "https://ftp.mozilla.org/pub/devedition/releases/$pkgver/SHA512SUMS.asc"
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

prepare() {
    # Check if hash of the source archive matches the one provided by Mozilla (which was signed with GPG).
    _checksum=`grep "linux-x86_64/$_lang/firefox-$pkgver.tar.bz2" $srcdir/SHA512SUMS | cut -f1 -d " "`
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
    install -d $pkgdir/{usr/{bin,share/{applications,pixmaps}},opt}
    cp -r firefox $pkgdir/opt/firefox-$_channel

    ln -s /opt/firefox-$_channel/firefox $pkgdir/usr/bin/firefox-$_channel
    install -m644 $srcdir/firefox-$_channel.desktop $pkgdir/usr/share/applications/
    install -m644 $srcdir/firefox/browser/icons/mozicon128.png $pkgdir/usr/share/pixmaps/firefox-${_channel}-icon.png
    install -Dm644 $srcdir/vendor.js $pkgdir/opt/firefox-$_channel/browser/defaults/preferences/vendor.js
}

sha512sums=('52a268d686ea189bc714f771e7ffe2176d77854529a0e3b17c71669e7651a28b2c8a91a7ec132a9e9d61793e69bc74b8102860d714ea2e6159c1f8d38bcddd0b'
            'b7923408506f5d011869d0baecc0f4245d6b60f4371a16c02eb4b83b7a8b8d4a78fd4b2ec4d2c538641d807f822d0f3b23d8c5c5557bc7c39d3460fdcefa5355'
            'SKIP'
            'f79af68a2d34dd60c89755094ac5d8675fe968d18897683efebdeec56c5ed56ca87276d83dc48c0ba91e2697dc4c39c29fe49245d8eb22ef84e8515917ea7e2b'
            'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010')

