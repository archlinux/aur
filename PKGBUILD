# Maintainer: Harrison <htv04rules at gmail com>

# Package info
_pkgname=firefox
pkgname=$_pkgname-opensuse-bin
pkgver=122.0
pkgrel=2
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
    _rpmver="$pkgver-3.3"
    source=("https://download.opensuse.org/repositories/mozilla/openSUSE_$_opensuse/$_arch/MozillaFirefox-$_rpmver.$_arch.rpm")
    ;;
  *) # Use official repo
    _rpmver="$pkgver-2.1"
    source=("https://download.opensuse.org/ports/$_arch/${_opensuse,,}/repo/oss/$_arch/MozillaFirefox-$_rpmver.$_arch.rpm")
    ;;
esac
source+=("file://vendor.js")
case $_arch in
  x86_64) sha256sums=("168d58c9534d5dea28dec3f6f73e91eefb5f034362a250cd5c8388654270817f") ;;
  i686) sha256sums=("d990cfe4e917bb23a65b0f29e361b4cad5cf5005c7c296c569cc6735f1e8e409") ;;
  aarch64) sha256sums=("b98fde0c6fcf4d456f4802ab1ee3aad16517ecddea6bb91d9cee16b15cbada74") ;;
  *) sha256sums=(SKIP) ;;
esac
sha256sums+=("50879baa1b25f003489a41f5bf2d0ca7ae76c971d34c30728229a832799eed9e")

# Build package
package() {
  mv "$srcdir/usr" "$pkgdir/usr"
  mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"

  install -Dvm644 "$srcdir/vendor.js" "$pkgdir/usr/lib/$_pkgname/browser/defaults/preferences/vendor.js"
}
