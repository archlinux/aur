# Maintainer: Harrison <htv04rules at gmail com>

# Package info
_pkgname=firefox
pkgname=$_pkgname-opensuse-bin
pkgver=121.0
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org with openSUSE patches"
arch=(x86_64)
url="https://en.opensuse.org/Firefox"
license=(
  GPL
  LGPL
  MPL
)
depends=(
  dbus
  ffmpeg
  gtk3
  kmozillahelper
  libpulse
  libxss
  libxt
  mime-types
  nss
  ttf-font
)
optdepends=(
  'hunspell-en_US: Spell checking, American English'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'pulseaudio: Audio support'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland'
)
provides=($_pkgname)
conflicts=($_pkgname)

# RPM
_opensuse="Tumbleweed"
_rpmver="$pkgver-2.1"
source=("https://download.opensuse.org/repositories/mozilla/openSUSE_$_opensuse/x86_64/MozillaFirefox-$_rpmver.x86_64.rpm")
sha256sums=("da75800470b179b6b081341f486d2e91589a953a1f8d7f29aa128437c5fa46d0")

# Build package
package() {
  find $srcdir/ -mindepth 1 -maxdepth 1 -type d | xargs cp -r -t "$pkgdir"
  mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"

  install -Dvm644 /dev/stdin "$pkgdir/usr/lib/$_pkgname/browser/defaults/preferences/vendor.js" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable extensions in the application directory
pref("extensions.autoDisableScopes", 11);

// Enable GNOME Shell search provider
pref("browser.gnome-search-provider.enabled", true);
END
}
