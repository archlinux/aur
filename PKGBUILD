# Maintainer: Harrison <htv04rules at gmail com>

# Package info
_pkgname=firefox
pkgname=$_pkgname-opensuse-bin
pkgver=122.0
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
_opensuse="Tumbleweed"
case $CARCH in
  pentium4) _arch=i686 ;;
  *) _arch=$CARCH ;;
esac
case $_arch in
  x86_64 | i686) # Use mozilla repo
    _rpmver="$pkgver-3.2"
    source=("https://download.opensuse.org/repositories/mozilla/openSUSE_$_opensuse/$_arch/MozillaFirefox-$_rpmver.$_arch.rpm")
    ;;
  *) # Use official repo
    _rpmver="121.0.1-1.1"
    source=("https://download.opensuse.org/ports/$_arch/${_opensuse,,}/repo/oss/$_arch/MozillaFirefox-$_rpmver.$_arch.rpm")
    ;;
esac
source+=("file://vendor.js")
case $_arch in
  x86_64) sha256sums=("3bfebe1bc30896b40353ffe10c66ee3aabd6f64f77547ef1c671bb7fb5490bef") ;;
  i686) sha256sums=("13e9d4f121d89ee581a7839d1be5c5bcff434f1cd0902bbddc8dd451e8f1a2c5") ;;
  aarch64) sha256sums=("a7b9bd5ccba5f66058b987c11c07d3c65cf7667a4b5a5760c5187fe2678d68d9") ;;
  *) sha256sums=(SKIP) ;;
esac
sha256sums+=("50879baa1b25f003489a41f5bf2d0ca7ae76c971d34c30728229a832799eed9e")

# Build package
package() {
  mv "$srcdir/usr" "$pkgdir/usr"
  mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"

  install -Dvm644 "$srcdir/vendor.js" "$pkgdir/usr/lib/$_pkgname/browser/defaults/preferences/vendor.js"
}
