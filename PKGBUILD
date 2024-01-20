# Maintainer: Harrison <htv04rules at gmail com>

# Package info
_pkgname=firefox
pkgname=$_pkgname-opensuse-bin
pkgver=121.0.1
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org with openSUSE patches"
arch=(x86_64 pentium4 i686 aarch64)
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
case $CARCH in
  pentium4) _arch=i686 ;;
  *) _arch=$CARCH ;;
esac
case $_arch in
  x86_64 | i686) # Use mozilla repo
    _opensuse="Tumbleweed"
    _rpmrel="1.3"
    source=("https://download.opensuse.org/repositories/mozilla/openSUSE_$_opensuse/$_arch/MozillaFirefox-$pkgver-$_rpmrel.$_arch.rpm")
    ;;
  *) # Use official repo
    _opensuse="tumbleweed"
    _rpmrel="1.1"
    source=("https://download.opensuse.org/ports/$_arch/$_opensuse/repo/oss/$_arch/MozillaFirefox-$pkgver-$_rpmrel.$_arch.rpm")
    ;;
esac
case $_arch in
  x86_64) sha256sums=("65837e4a79e88dcff4479b5dabab52c2f2303bacbaadcb8fec609ff221c48e7c") ;;
  i686) sha256sums=("d3444fd683a6c7ea663c9f62f255929c9fcfac6ac177b2ce562c7285c55c346f") ;;
  aarch64) sha256sums=("a7b9bd5ccba5f66058b987c11c07d3c65cf7667a4b5a5760c5187fe2678d68d9") ;;
  *) sha256sums=(SKIP) ;;
esac

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
