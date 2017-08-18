# Maintainer Tamás Barta <barta dot tamas dot d at gmail dot com>
# Based on PKGBUILD:
# * `firefox-developer`
# * `firefox-developer-es-mx`
# * `firefox-developer-de`
# * `firefox-developer-da`
# Fontos: a "Mozilla Sofware Releases <release@mozilla.com>" PGP kulcs importálása szükséges
#   $ gpg --keyserver pgp.mit.edu --recv-keys 14F26682D0916CDD81E37B6D61B7B526D98F0353

_name=firefox
_channel=developer
_lang=hu

pkgname="${_name}-${_channel}-${_lang}"
pkgdesc='Standalone web browser from mozilla.org, developer build - Hungarian'
url='http://www.mozilla.org/firefox/developer'
pkgver='56.0b3'
pkgrel=2
arch=('x86_64')
license=('MPL' 'GPL' 'LGPL')
_file="${_name}-${pkgver}"
_url="https://download-installer.cdn.mozilla.net/pub/devedition/releases/${pkgver}"
_loc="linux-${arch}/${_lang}"
source=("${_url}/${_loc}/${_file}.tar.bz2"
        "${_url}/SHA512SUMS"
        "${_url}/SHA512SUMS.asc"
        "${_name}-${_channel}.desktop"
        "vendor.js")
sha512sums=('0a9d618609f913c4a20c9bf10a36b298d8a9eb5ba4c9f58d92416b605d4887db69467a25b26f51ca8d931b2a3aacf7ec6e5ad2efb99aa89ac620c22e596a6b19'
            '1d85e3e2e26b9674a074bd9aea35590af5e66f1f313fb642194424705f77ed484ea8899f1205b72d9f6d90d5273bf10d0fc033a878d2afc370f1d8da175f8856'
            'SKIP'
            '11fdb7d17b51f2e94f08de487cafab6cda1a93e84b6f2dca1c49f38e7737ed05c05d8d22b8b82ad4a6758e8da43029bf37137b9976203f96f84bb3b23d126f42'
            'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010')
validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353') # Mozilla’s GnuPG release key
# Dependencies
# https://www.archlinux.org/packages/extra/x86_64/firefox/
depends=('dbus-glib' 'gtk3' 'libxt' 'mime-types' 'nss' 'sqlite')
optdepends=(
        'alsa-lib: An alternative implementation of Linux sound support'
        'ffmpeg: Complete solution to record, convert and stream audio and video'
        'gtk2: flash plugin support'
        'gtk3-print-backends: Print support'
        'hunspell: Spell checking'
        'hyphen: Hyphenation'
        'libnotify: Notification integration'
        'networkmanager: Location detection via available WiFi networks'
        'pulseaudio: Audio/video playback'
        'speech-dispatcher: Text to Speech'
        'startup-notification: Support for FreeDesktop Startup Notification'
)

prepare() {
    msg "!> Fontos: a 'Mozilla Sofware Releases' <release@mozilla.com>"
    msg "!>   PGP kulcs importálása szükséges"
    msg "!> További információt itt találhat:"
    msg "!>   <https://wiki.archlinux.org/index.php/GnuPG#Import_a_public_key>"
    msg "!> $ gpg --keyserver pgp.mit.edu --recv-keys D98F0353"

    # Check if hash of the source archive matches the one provided by Mozilla (which was signed with GPG).
    _checksum=`grep "linux-x86_64/$_lang/firefox-$pkgver.tar.bz2" $srcdir/SHA512SUMS | cut -f1 -d " "`
    _actual=`sha512sum $srcdir/firefox-$pkgver.tar.bz2 | cut -f1 -d " "`

    msg "!> Checking integrity of firefox-$pkgver.tar.bz2"

    if [[ $_checksum == $_actual ]];
    then
        msg "!> Integrity verified successfully."
    else
        msg "!> Integrity verification failed!"
        exit 1
    fi
}

package() {
    opt_path="opt/${pkgname}"
    # install binaries
    install -d $pkgdir/{usr/{bin,share/{applications,pixmaps}},opt}
    cp -r firefox $pkgdir/${opt_path}
    # symlink binary
    ln -s /${opt_path}/firefox $pkgdir/usr/bin/$_name-$_channel
    # install icon
    install -m644 $srcdir/firefox/browser/icons/mozicon128.png $pkgdir/usr/share/pixmaps/$_name-${_channel}-icon.png
    # install desktop file
    install -m644 $srcdir/$_name-$_channel.desktop $pkgdir/usr/share/applications/
    # install vendor.js file
    install -Dm644 $srcdir/vendor.js $pkgdir/opt/$_name-$_channel/browser/defaults/preferences/vendor.js
}
