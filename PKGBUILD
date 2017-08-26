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
pkgver='56.0b6'
pkgrel=1
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
sha512sums=('81cdebd0af73a7b8983e2de296f12244a6b0a92be865d0fbe089d74af127663cc3003e822bf525316bb14664ccfa3412b7424069d1b7abd17ce1e54cd5f66c7a'
            '1bc4b43d61d3e5f7cff46992c9cff7494d5cf9918f27dce29bb9369e8e1d86cf56ef8398b43ba4d7ba7be6856a5ae120fb3e4b9a32ab72818f45cf679b16707f'
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
