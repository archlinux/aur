# Maintainer: hawkeye116477 <hawkeye116477 at gmail dot com>
# Contributor: Plague-doctor <plague <at>> privacyrequired <<dot>> com >
# Contributor: Simon Kronberg <Simon.Kronberg at gmail dot com>

pkgname=waterfox-classic-bin
pkgver=2022.06
pkgrel=0
pkgdesc="Customizable privacy-conscious web browser with primary support for legacy extensions"
arch=('x86_64')
url="https://classic.waterfox.net"
license=('MPL')
depends=('gtk3' 'gtk2' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib' 'ffmpeg'
         'ttf-font' 'hicolor-icon-theme')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'alsa-lib: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
provides=("waterfox-classic=${pkgver}")
conflicts=('waterfox-classic' 'waterfox-classic-git')
replaces=('waterfox-bin')

source=('waterfox-classic.desktop'
        'https://github.com/WaterfoxCo/Waterfox-Classic/releases/download/'"${pkgver}"'-classic/waterfox-classic-'"${pkgver}"'.en-US.linux-'"${arch}"'.tar.bz2')

package() {
    # Create the directories.
    install -d "${pkgdir}"/{usr/{bin,share/applications},opt}

    # Install the desktop files.
    install -m644 "${srcdir}"/waterfox-classic.desktop "${pkgdir}"/usr/share/applications/

    # Copy the directory to /opt
    cp -r waterfox-classic "${pkgdir}"/opt/waterfox-classic

    # Install icons
    for i in 16 22 24 32 48 64 128 256; do
        install -d "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps"
        ln -Ts /opt/waterfox-classic/browser/chrome/icons/default/default$i.png \
            "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/waterfox-classic.png"
    done

    # Install a wrapper to avoid confusion about binary path
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/waterfox-classic" <<END
#!/bin/sh
exec /opt/waterfox-classic/waterfox "\$@"
END

    # Replace duplicate binary with wrapper
    # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
    ln -srf "$pkgdir/usr/bin/waterfox-classic" \
        "$pkgdir/opt/waterfox-classic/waterfox-bin"

    # Add additional useful settings
    rm -r "$pkgdir"/opt/waterfox-classic/dictionaries
    install -Dm644 /dev/stdin "$pkgdir/opt/waterfox-classic/browser/defaults/preferences/vendor.js" <<END
// Disable default browser checking
pref("browser.shell.checkDefaultBrowser", false);

// Use LANG environment variable to choose locale
pref("intl.locale.matchOS", true);

// Automatic installation of updates won't work on root, so disable this
pref("app.update.auto", false);

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");
END

}

sha256sums=('5504d06da38c87cf655f8109047ebfdd09baa8588e08a7ee93c0012e2c5a7ad3'
            'f7fc7baa86285e23bcd96b919c25aa4455c27d88ca1142ac756c20dd44f5acab')
