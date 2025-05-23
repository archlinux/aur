# Maintainer: envolution
# Contributor: hawkeye116477 <hawkeye116477 at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=waterfox-bin
pkgver=6.5.9
pkgrel=3
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
source=("https://cdn1.waterfox.net/waterfox/releases/${pkgver}/Linux_x86_64/waterfox-${pkgver}.tar.bz2"
        "waterfox.desktop")

#agent lizard
export _agent="Mozilla/5.0 (X11; Linux x86_64; rv:124.0) Gecko/20100101 Firefox/124.0"
# override the download function and split out filename since waterfox's web admin wants to make life difficult
download_file() {
  # source url with/without :: filename identifier
  if [[ "$1" == *"::"* ]]; then
    local url="${1#*::}"  #everything before ::
    local output_file="${1%%::*}"  #grab download name pre ::
  else
    local url="$1"
    local output_file="$2"
  fi
  
  # if we still don't have a filename, get it from the url
  if [ -z "$output_file" ]; then
    output_file=$(basename "$url")
  fi
  
  # imagine being able to download a file normally
  curl -L \
    -A "$_agent" \
    -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8" \
    -H "Accept-Language: en-US,en;q=0.5" \
    -H "Referer: https://www.waterfox.net/" \
    -H "Connection: keep-alive" \
    -H "Upgrade-Insecure-Requests: 1" \
    -o "$output_file" \
    "$url"
  
  return $?
}

#use our override function for the download 
DLAGENTS=('https::/bin/bash -c "download_file %u %o"')

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

sha512sums=('dbd9ce9bcb17602e41ccdfaa17aafb72c42cc3ed68ea0ff253ec1e839448106ee1708bf7916a7394bed34108dd759cceee9b587cc7340823c026830e4d6e7601'
            'd0ff0445021b975d52eee7dac27dfdc0d170da07f8a8dc1676ba53387c2006f0598c163b36b07abdbb411cfb61bf52b8222fc5882bdfa8dfcd13d99cb44c92b6')
# vim:set ts=2 sw=2 et:
