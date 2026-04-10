# Maintainer: Exorcism, AutoUpdateBot
# Contributor: envolution
# Contributor: hawkeye116477 <hawkeye116477 at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=waterfox-bin
epoch=1
pkgver=6.6.11
pkgrel=2
pkgdesc="Current/modern generation of customizable privacy-conscious web browser."
arch=('x86_64')
url="https://www.waterfox.net"
license=('MPL-2.0')
depends=('gtk3' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib' 'ffmpeg'
  'ttf-font' 'hicolor-icon-theme')
optdepends=('networkmanager: Location detection via available WiFi networks'
  'libnotify: Notification integration'
  'pulseaudio: Audio support'
  'alsa-lib: Audio support'
  'speech-dispatcher: Text-to-Speech'
  'hunspell-en_US: Spell checking, American English')
provides=("waterfox=${pkgver}")
source=("waterfox-${pkgver}-${pkgrel}.tar.bz2::https://cdn.waterfox.com/waterfox/releases/${pkgver}/Linux_x86_64/waterfox-${pkgver}.tar.bz2"
  "waterfox.desktop")
conflicts=('waterfox')

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

sha512sums=('5a735e9c410c8d20f141e4c5bb7ee1d86bbe44315c8f24b64a697c02252538bfa75bfa485ccee8d1a18aa87faf85a147b6a614107b6e8d4ef59d75deedda8437'
            'd0237cffceb1f22bcef3479ee192360c069052534cbe6f452bf88e671ba26b7d8d04f6cdbb4f34647277b64136093d703b5f9ac8071fe0d3c80d70b1e1395a84')
# vim:set ts=2 sw=2 et:
