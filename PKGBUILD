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

pkgname="${_name}-${_channel}-de"
pkgdesc='Standalone web browser from mozilla.org, developer build - German'
url='http://www.mozilla.org/firefox/developer'
pkgver=54.0b14
pkgrel=1
arch=('x86_64')
license=('MPL' 'GPL' 'LGPL')
_file="${_name}-${_release_version}.de.linux-x86_64"
_release_dir="${_release_year}-${_release_month}-${_release_day}-${_release_time}-mozilla-aurora-l10n"
source=("https://ftp.mozilla.org/pub/devedition/releases/$pkgver/linux-x86_64/de/firefox-$pkgver.tar.bz2"
        "https://ftp.mozilla.org/pub/devedition/releases/$pkgver/SHA512SUMS"
        "https://ftp.mozilla.org/pub/devedition/releases/$pkgver/SHA512SUMS.asc"
        "firefox-$_channel.desktop"
        "vendor.js")
depends=('alsa-lib' 'libxt' 'libnotify' 'mime-types' 'nss' 'gtk2' 'gtk3' 'sqlite' 'dbus-glib')
provides=(firefox-developer)
conflicts=(firefox-developer)

validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353')

prepare() {
    # Check if hash of the source archive matches the one provided by Mozilla (which was signed with GPG).
    _checksum=`grep "linux-x86_64/de/firefox-$pkgver.tar.bz2" $srcdir/SHA512SUMS | cut -f1 -d " "`
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

sha512sums=('f871bbc4cce559fad162d4579c46623a81c8a9faec2b0328f5f3e9492bfcdb64d5311cc8aa75ec3e8ebb2c0f2823193fff163a345e3cca43e70df0bd355e998a'
            'a41b356b0d48a88d311f291c21e0ea7a7a8723a5fbd0f783fb102c97a50e90323b736641e1c4370cc8863b60bad0bc2028d68f4a4a10ed66d6055cfa37d2d6a6'
            'SKIP'
            'f79af68a2d34dd60c89755094ac5d8675fe968d18897683efebdeec56c5ed56ca87276d83dc48c0ba91e2697dc4c39c29fe49245d8eb22ef84e8515917ea7e2b'
            'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010')

