# Maintainer: Simon Kronberg <Simon.Kronberg@gmail.com>
# Contributor: hawkeye116477 <hawkeye116477 at gmail dot com>

pkgname=waterfox-current-bin
pkgver=2020.07
pkgrel=1
pkgdesc="64-bit Firefox fork; no telemetry; supports XUL & XPCOM (incl. unsigned) add-ons."
arch=('x86_64')
url="https://www.waterfox.net"
license=('MPL')
depends=('gtk3' 'gtk2' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib' 'ffmpeg'
         'ttf-font' 'hicolor-icon-theme' 'nss')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'alsa-lib: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
provides=("waterfox-current=${pkgver}")
conflicts=('waterfox-current')
replaces=('waterfox-alpha-bin')

source=('waterfox-current.desktop'
        'https://storage-waterfox.netdna-ssl.com/releases/linux64/installer/waterfox-current-'"${pkgver}"'.en-US.linux-x86_64.tar.bz2')

package() {
	# Create the necessary directories.
	install -d "${pkgdir}"/{usr/{bin,share/applications},opt}

	# Install the desktop files.
	install -m644 "${srcdir}"/waterfox-current.desktop "${pkgdir}"/usr/share/applications/

	# Copy the extracted directory to /opt/.
	cp -r waterfox "${pkgdir}"/opt/waterfox-current

	# Install icons
    for i in 16 32 48 64 128; do
        install -d "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps"
        ln -Ts /opt/waterfox-current/browser/chrome/icons/default/default$i.png \
            "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/waterfox-current.png"
    done

    # Add additional useful settings
    install -Dm644 /dev/stdin "$pkgdir/opt/waterfox-current/browser/defaults/preferences/vendor.js" <<END
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
	ln -s /opt/waterfox-current/waterfox "${pkgdir}"/usr/bin/waterfox-current
}

sha256sums=('b8db6f9ee6abd9349b41333bf01ba04ef78a36335f94f35d9ea6762bc4fea548'
            '6088a3ee3ae282545b44d04218f5af7d9da288b6659a79ec3706111c8a0c6760')
