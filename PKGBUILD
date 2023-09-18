# Maintainer: Antiquete <antiquete@proton.me>
# Contributor: hawkeye116477 <hawkeye116477 at gmail dot com>
# Contributor: Simon Kronberg <Simon.Kronberg at gmail dot com>

pkgname=waterfox-g6-bin
pkgver=6.0b5
pkgrel=1
pkgdesc="Sixth generation of customizable privacy-conscious web browser."
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
provides=("waterfox-g6=${pkgver}")
conflicts=('waterfox-g6')

source=('waterfox-g6.desktop'
        'https://cdn1.waterfox.net/waterfox/releases/G'"${pkgver}"'/Linux_x86_64/waterfox-G'"${pkgver}"'.tar.bz2')

package() {
	# Create the necessary directories.
	install -d "${pkgdir}"/{usr/{bin,share/applications},opt}

	# Install the desktop files.
	install -m644 "${srcdir}"/waterfox-g6.desktop "${pkgdir}"/usr/share/applications/

	# Copy the extracted directory to /opt/.
	cp -r waterfox "${pkgdir}"/opt/waterfox-g6

	# Install icons
    for i in 16 32 48 64 128; do
        install -d "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps"
        ln -Ts /opt/waterfox-g6/browser/chrome/icons/default/default$i.png \
            "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/waterfox-g6.png"
    done

    # Add additional useful settings
    install -Dm644 /dev/stdin "$pkgdir/opt/waterfox-g6/browser/defaults/preferences/vendor.js" <<END
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
	ln -s /opt/waterfox-g6/waterfox "${pkgdir}"/usr/bin/waterfox-g6
}

sha256sums=('977e11a146a82250d5fea5803ff9cba36c4db0703aa734b2a538ae350e322c9c'
            '878e1e3f56032b0ee372dca66ce55eec3d257da75687535529965aea32c4d808')

