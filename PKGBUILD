# Maintainer: Harrison <htv04rules at gmail com>

# Package info
_pkgname=firefox
pkgname=$_pkgname-opensuse-bin
pkgver=123.0.1
pkgrel=3
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
makedepends=(
  curl
  jq
)
optdepends=(
  "hunspell-en_US: Spell checking, American English"
  "libnotify: Notification integration"
  "networkmanager: Location detection via available WiFi networks"
  "pulseaudio: Audio support"
  "speech-dispatcher: Text-to-Speech"
  "xdg-desktop-portal: Screensharing with Wayland"
)
provides=($_pkgname)
conflicts=($_pkgname)

# RPM
_opensuse="Tumbleweed"
case $CARCH in
  pentium4) _arch=i686 ;;
  *) _arch="$CARCH" ;;
esac
case $_arch in
  x86_64 | i686) # Use mozilla repo
    _repo=https://download.opensuse.org/repositories/mozilla/openSUSE_$_opensuse/$_arch
    ;;
  *) # Use official (ports) repo
    _repo=https://download.opensuse.org/ports/$_arch/${_opensuse,,}/repo/oss/$_arch
    ;;
esac
_rpm="$(curl $_repo/?jsontable | jq '[.data[] | select(.name | test("^MozillaFirefox-\\d")) | .name] | max' | tr -d '"')"
if [[ -z $_rpm ]]; then
   exit 1
fi
source=(
  $_repo/$_rpm
  file://vendor.js
)
sha256sums=(
  SKIP
  50879baa1b25f003489a41f5bf2d0ca7ae76c971d34c30728229a832799eed9e
)

pkgver() {
  echo $_rpm | awk -F '[-]' '{print $2}'
}

# Build package
package() {
  mv "$srcdir/usr" "$pkgdir/usr"
  mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"

  install -Dvm644 "$srcdir/vendor.js" "$pkgdir/usr/lib/$_pkgname/browser/defaults/preferences/vendor.js"
}
