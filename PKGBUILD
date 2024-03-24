# Maintainer: hawkeye116477 <hawkeye116477 at gmail dot com>

pkgname=waterfox-bin
_pkgver=6.0.11
pkgver=G${_pkgver}
pkgrel=1
pkgdesc="Current/modern generation of customizable privacy-conscious web browser."
arch=('x86_64')
url="https://www.waterfox.net"
license=('MPL')
depends=('gtk3' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib' 'ffmpeg'
         'ttf-font' 'hicolor-icon-theme')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'alsa-lib: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
provides=("waterfox-g=${_pkgver}" "waterfox=${pkgver}")
source=('waterfox.desktop'
        'https://cdn1.waterfox.net/waterfox/releases/'"${pkgver}"'/Linux_x86_64/waterfox-'"${pkgver}"'.tar.bz2')

package() {
	# Create the necessary directories.
	install -d "${pkgdir}"/{usr/{bin,share/applications},opt}

	# Install the desktop files.
	install -m644 "${srcdir}"/waterfox.desktop "${pkgdir}"/usr/share/applications/

	# Copy the extracted directory to /opt/.
	cp -r waterfox "${pkgdir}"/opt/waterfox

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

# Disable automatic updates and update notifications and allow only for manual update checking
    install -Dm644 /dev/stdin "$pkgdir/opt/waterfox/distribution/policies.json" <<END
{
    "policies": {
        "AppAutoUpdate": false,
        "ManualAppUpdateOnly": true
    }
}
END

	# Symlink the binary to /usr/bin/.
	ln -s /opt/waterfox/waterfox "${pkgdir}"/usr/bin/waterfox
    # Backward compatibility symlink
	ln -s /opt/waterfox/waterfox "${pkgdir}"/usr/bin/waterfox-g
}

sha512sums=('d0ff0445021b975d52eee7dac27dfdc0d170da07f8a8dc1676ba53387c2006f0598c163b36b07abdbb411cfb61bf52b8222fc5882bdfa8dfcd13d99cb44c92b6'
            '2959f286e11a1aaa1da1e244ad4b3aac0ffe8b18a782e359d4be4ecf323d47f7f4d90d1399cd29e7abf35b3dee39b54dc359d81f93f9616f9e1242e7617524f9')
