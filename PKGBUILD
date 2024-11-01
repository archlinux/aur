# Maintainer: Luis Vervaet <luisvervaet@gmail.com>
# Maintainer: Peter Jung <admin@ptr1337.dev>
# Contributor: NextWorks <nextworks@protonmail.com>
# Contributor: Alad Wenter <alad@archlinux.org>
# Contributor: Luna Jernberg <droidbittin@gmail.com>
# Contributor: Hilton Medeiros <medeiros.hilton@gmail.com>
# Contributor: Simon Brulhart <simon@brulhart.me>
# Contributor: Det <nimetonmaili g-mail>, Achilleas Pipinellis, speed145a, Schnouki, aus

pkgname=zen-browser-avx2-bin
_pkgname=zen-browser
_realpkgver=1.0.1-a.17
_desktopname=zen-alpha
pkgver=1.0.1.a.17
pkgrel=1
pkgdesc="Performance oriented Firefox-based web browser - Utilizes AVX2 for better performance"
arch=('x86_64' 'i686')
url="https://github.com/zen-browser/desktop"
license=(MPL-2.0)
depends=(gtk3 libxt mime-types dbus-glib nss ttf-font systemd)
optdepends=('ffmpeg: H264/AAC/MP3 decoding'
            'networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulse-native-provider: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
options=(!strip)
provides=("zen-browser=$pkgver")
conflicts=('zen-browser')

source=("zen-browser-$_realpkgver.tar.bz2::https://github.com/zen-browser/desktop/releases/download/$_realpkgver/zen.linux-specific.tar.bz2"
        "$_pkgname.sh"
        "$_desktopname.desktop"
        "policies.json")
sha256sums=('eab4a5d1bd46ea1722782e3f9529ff6e4cbef057afc4b669d4d75cb10d53a7b1'
            'b32396cfb4272398d68c59b48c548b86f99ca4ea70bce8e6bed434819b165e53'
            'e81e41cb90be3d189c541fb4b013d9250d07f9c6a3bb219065719326514c33b0'
            'f93eb77db526147a8a20744905923a6eda79e2fbcc9f282e2f9228a7a995c798')

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
