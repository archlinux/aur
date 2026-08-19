# Maintainer: Luis Vervaet <luisvervaet@gmail.com>
# Contributor: Peter Jung <admin@ptr1337.dev>
# Contributor: NextWorks <nextworks@protonmail.com>
# Contributor: Alad Wenter <alad@archlinux.org>
# Contributor: Luna Jernberg <droidbittin@gmail.com>
# Contributor: Hilton Medeiros <medeiros.hilton@gmail.com>
# Contributor: Simon Brulhart <simon@brulhart.me>
# Contributor: Det <nimetonmaili g-mail>, Achilleas Pipinellis, speed145a, Schnouki, aus

pkgname=zen-browser-bin
_pkgname=zen-browser
_desktopname=zen
pkgver=1.21.15b
pkgrel=1
pkgdesc="Official package for Zen, a privacy-focused, feature packed Firefox-based web browser"
arch=('x86_64' 'aarch64')
url="https://github.com/zen-browser/desktop"
license=(MPL-2.0)
depends=(gtk3 libxt mime-types dbus-glib nss ttf-font systemd ffmpeg)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulse-native-provider: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
options=(!strip)
provides=("zen-browser=$pkgver")
conflicts=('zen-browser')

source_x86_64=("zen-browser-$pkgver-$pkgrel-x86_64.tar.xz::https://github.com/zen-browser/desktop/releases/download/$pkgver/zen.linux-x86_64.tar.xz")
source_aarch64=("zen-browser-$pkgver-$pkgrel-aarch64.tar.xz::https://github.com/zen-browser/desktop/releases/download/$pkgver/zen.linux-aarch64.tar.xz")

source=("$_pkgname.sh"
        "$_desktopname.desktop"
        "policies.json")
sha256sums=('642bcde5b15fddb712d10ed53299781108a265432237ab27a96c5c5c489718db'
            'bfb347f0e0f6baccaf3b7b51b19a25e5b745d836734cec38611b32af842897f6'
            'fd9572d178ea1a5edf427ca85bad3fb2d83be2e250e62bad13951d70d977bd0f')
sha256sums_x86_64=('2eaea664b840067ca0ace623bd4f4548fae98f46a98e2ddbdfdcb9253b674bbf')
sha256sums_aarch64=('73a609b954e7dcef8dc49b1efc9c13b688ecfa24ba1b3f39ad653e9324b889cf')


package() {
  # Create directories
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/applications
  mkdir -p "$pkgdir"/opt

  # Install
  cp -r zen/ "$pkgdir"/opt/$pkgname

  # Launchers
  install -m755 $_pkgname.sh "$pkgdir"/usr/bin/$_pkgname

  # Desktops
  install -m644 *.desktop "$pkgdir"/usr/share/applications/

  # Icons
  for i in 16x16 32x32 48x48 64x64 128x128; do
    install -d "$pkgdir"/usr/share/icons/hicolor/$i/apps/
    ln -s /opt/$pkgname/browser/chrome/icons/default/default${i/x*}.png \
          "$pkgdir"/usr/share/icons/hicolor/$i/apps/$_pkgname.png
  done

  # Use system-provided dictionaries
  ln -Ts /usr/share/hunspell "$pkgdir"/opt/$pkgname/dictionaries
  ln -Ts /usr/share/hyphen "$pkgdir"/opt/$pkgname/hyphenation

  # Use system certificates
  ln -sf /usr/lib/libnssckbi.so "$pkgdir"/opt/$pkgname/libnssckbi.so

  # Disable update checks (managed by pacman)
  mkdir "$pkgdir"/opt/$pkgname/distribution
  install -m644 "$srcdir"/policies.json "$pkgdir"/opt/$pkgname/distribution/
}
