# Maintainer: Leo Izen <leo.izen@gmail.com>
# Maintainer: Simon Kronberg <Simon.Kronberg at gmail dot com>
# Contributor: hawkeye116477 <hawkeye116477 at gmail dot com>

pkgname=waterfox-current-bin
pkgver=G6.0
pkgrel=1
pkgdesc="64-bit Firefox fork; no telemetry"
arch=('x86_64')
url="https://www.waterfox.net"
license=('MPL')
depends=('gtk3' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib' 'ffmpeg'
         'ttf-font' 'hicolor-icon-theme' 'nss')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'alsa-lib: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
provides=("waterfox-current=${pkgver}" "waterfox=${pkgver}")
conflicts=('waterfox-current')
replaces=('waterfox-alpha-bin')

source=('waterfox.desktop'
        'https://cdn1.waterfox.net/waterfox/releases/'"${pkgver}"'/Linux_x86_64/waterfox-'"${pkgver}"'.tar.bz2')
noextract=('waterfox-'"${pkgver}"'.tar.bz2')

prepare() {
    mkdir -p "${srcdir}"/waterfox
    bsdtar -C "${srcdir}"/waterfox -jxf 'waterfox-'"${pkgver}"'.tar.bz2'
}

package() {
	# Create the necessary directories.
	install -d "${pkgdir}"/{usr/{bin,share/applications},opt}

	# Install the desktop files.
	install -m644 "${srcdir}"/waterfox.desktop "${pkgdir}"/usr/share/applications/

	# Copy the extracted directory to /opt/.
	cp -a "${srcdir}"/waterfox "${pkgdir}"/opt/waterfox

	# Install icons
    for i in 16 32 48 64 128; do
        install -d "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps"
        ln -Ts /opt/waterfox/browser/chrome/icons/default/default$i.png \
            "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/waterfox.png"
    done

    # Add additional useful settings
    install -Dm644 /dev/stdin "$pkgdir/opt/waterfox/browser/defaults/preferences/vendor.js" <<END
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
	ln -Ts /opt/waterfox/waterfox "${pkgdir}"/usr/bin/waterfox
}

sha256sums=('4159b4bfe1538a79cba6d4bd07e5c62452b28fc347d895013ac3574f2bba9055'
            'f2a49ecc5ff0f3a248a7972aa45b589178793ceb373c947bceca407c143ca68e')
