# Maintainer: hawkeye116477 <hawkeye116477 at gmail dot com>
# Contributor: Simon Kronberg <Simon.Kronberg at gmail dot com>

pkgname=waterfox-g3-bin
pkgver=2.1
pkgrel=1
pkgdesc="Third generation of customizable privacy-conscious web browser."
arch=('x86_64')
url="https://www.waterfox.net"
license=('MPL')
depends=('gtk3' 'gtk2' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib' 'ffmpeg'
         'ttf-font' 'hicolor-icon-theme')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'alsa-lib: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
provides=("waterfox-g3=${pkgver}")
conflicts=('waterfox-g3')

source=('waterfox-g3.desktop'
        'https://cdn.waterfox.net/releases/linux64/installer/waterfox-G3.'"${pkgver}"'.en-US.linux-x86_64.tar.bz2')

package() {
	# Create the necessary directories.
	install -d "${pkgdir}"/{usr/{bin,share/applications},opt}

	# Install the desktop files.
	install -m644 "${srcdir}"/waterfox-g3.desktop "${pkgdir}"/usr/share/applications/

	# Copy the extracted directory to /opt/.
	cp -r waterfox "${pkgdir}"/opt/waterfox-g3

	# Install icons
    for i in 16 32 48 64 128; do
        install -d "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps"
        ln -Ts /opt/waterfox-g3/browser/chrome/icons/default/default$i.png \
            "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/waterfox-g3.png"
    done

    # Add additional useful settings
    install -Dm644 /dev/stdin "$pkgdir/opt/waterfox-g3/browser/defaults/preferences/vendor.js" <<END
// Disable default browser checking
pref("browser.shell.checkDefaultBrowser", false);

// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Automatic installation of updates won't work on root, so disable this
pref("app.update.auto", false);

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");
END

	# Symlink the binary to /usr/bin/.
	ln -s /opt/waterfox-g3/waterfox "${pkgdir}"/usr/bin/waterfox-g3
}

sha256sums=('6d37d08ee522173057918de8ad8394ba62b61a38c102cb03439d257a93e4b4a6'
            'c62805b37dfad4d1328e3d73cd4d819b3bebe2904f86f42883b67b02640b1338')
