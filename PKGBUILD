# Maintainer: hawkeye116477 <hawkeye116477 at gmail dot com>

pkgname=waterfox-g-bin
pkgver=5.1.13
pkgrel=0
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
provides=("waterfox-g=${pkgver}" "waterfox=G${pkgver}")
conflicts=('waterfox-g')
source=('waterfox-g.desktop'
        'https://cdn1.waterfox.net/waterfox/releases/G'"${pkgver}"'/Linux_x86_64/waterfox-G'"${pkgver}"'.tar.bz2')

package() {
	# Create the necessary directories.
	install -d "${pkgdir}"/{usr/{bin,share/applications},opt}

	# Install the desktop files.
	install -m644 "${srcdir}"/waterfox-g.desktop "${pkgdir}"/usr/share/applications/

	# Copy the extracted directory to /opt/.
	cp -r waterfox "${pkgdir}"/opt/waterfox-g

	# Install icons
    for i in 16 32 48 64 128; do
        install -d "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps"
        ln -Ts /opt/waterfox-g/browser/chrome/icons/default/default$i.png \
            "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/waterfox-g.png"
    done

    # Add additional useful settings
    install -Dm644 /dev/stdin "$pkgdir/opt/waterfox-g/browser/defaults/preferences/vendor.js" <<END
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
    install -Dm644 /dev/stdin "$pkgdir/opt/waterfox-g/distribution/policies.json" <<END
{
    "policies": {
        "AppAutoUpdate": false,
        "ManualAppUpdateOnly": true
    }
}
END

	# Symlink the binary to /usr/bin/.
	ln -s /opt/waterfox-g/waterfox "${pkgdir}"/usr/bin/waterfox-g
}

sha512sums=('8eb1434df71bf41f5083e92cde87f4f4f03e7139e2d79da9a4e41253b03d3db4bd4a205f4ad30becf9ed2592addf3240ebff458881d62cbcfc3d788ffceb48a5'
            '954ce685454571c8a7ee87d7b03daec9f42e3a746de974fee3bad4c54e14671c1587b45d2d8bc647dc162e78813b5015b45e861fb1cbc0c2436532b9a9f62464')
