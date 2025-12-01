# Maintainer: Luis Vervaet <luisvervaet@gmail.com>
# Maintainer: Peter Jung <admin@ptr1337.dev>
# Contributor: NextWorks <nextworks@protonmail.com>
# Contributor: Alad Wenter <alad@archlinux.org>
# Contributor: Luna Jernberg <droidbittin@gmail.com>
# Contributor: Hilton Medeiros <medeiros.hilton@gmail.com>
# Contributor: Simon Brulhart <simon@brulhart.me>
# Contributor: Det <nimetonmaili g-mail>, Achilleas Pipinellis, speed145a, Schnouki, aus

pkgname=zen-browser-bin
_pkgname=zen-browser
_desktopname=zen
pkgver=1.17.12b
pkgrel=1
pkgdesc="Performance oriented Firefox-based web browser"
arch=('x86_64' 'aarch64')
url="https://github.com/zen-browser/desktop"
license=(MPL-2.0)
depends=(gtk3 libxt mime-types dbus-glib nss ttf-font systemd ffmpeg4.4)
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
            'a6371aa853b095d1c223f955e97a390b905abe5bcba38bbddd17408dd46fec94'
            'e977c3d690224dd727d8761d2c0a66ba41bfd02ae0fd7850c4545d06b5a8e63c')
sha256sums_x86_64=('cae97299622a6ef3fd8c06ff3494f8625094467ac5ac48ee63a81a0ac67fa14d')
sha256sums_aarch64=('b45f4389872999ae93eba2dd10323208010bcfb87f70bf2a5272074a71885d3b')


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
