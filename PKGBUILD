# Maintainer: Bruno <brogeriofernandes g-mail>

pkgname=firefox-quantum
pkgver=57.0
_major=${pkgver/rc*}
_build=${pkgver/*rc}
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org - quantum"
arch=('x86_64')
url="https://ftp.mozilla.org/pub/firefox/releases"
license=('MPL' 'GPL' 'LGPL')
depends=('dbus-glib' 'gtk3' 'libxt' 'nss')
optdepends=('ffmpeg: H264/AAC/MP3 decoding'
            'hunspell: Spell checking'
            'hyphen: Hyphenation'
            'libnotify: Notification integration'
            'networkmanager: Location detection via available WiFi networks'
            'pulseaudio: Sound'
            'upower: Battery API')
provides=("firefox-quantum=$pkgver")
#install=$pkgname.install
source=("$url/$pkgver/linux-x86_64/en-US/firefox-$pkgver.tar.bz2"
        "$pkgname.desktop")

sha256sums=('c2cae016089e816c03283a359c582efab3bca34e6048ecc2382b43c1eb342457'
            'ece8c24a133910f5961cce36483c5313dcdfad410fc95017e93b71bbdb75d702')

package() {
  # Create directories
  msg2 "Creating directory structure..."
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/applications
  mkdir -p "$pkgdir"/opt

  msg2 "Moving stuff in place..."
  # Install
  cp -r firefox/ "$pkgdir"/opt/$pkgname

  # Launchers
  ln -s "$pkgdir"/opt/$pkgname/firefox-bin "$pkgdir"/usr/bin/$pkgname  # compatibility
  # ln -sf $pkgname "$pkgdir"/opt/$pkgname/firefox-bin

  # Desktops
  install -m644 *.desktop "$pkgdir"/usr/share/applications/

  # Icons
  for i in 16x16 32x32 48x48; do
    install -d "$pkgdir"/usr/share/icons/hicolor/$i/apps/
    ln -s /opt/$pkgname/browser/chrome/icons/default/default${i/x*}.png \
          "$pkgdir"/usr/share/icons/hicolor/$i/apps/$pkgname.png
  done


  # Use system-provided dictionaries
  rm -r "$pkgdir"/opt/$pkgname/dictionaries
  ln -Ts /usr/share/hunspell "$pkgdir"/opt/$pkgname/dictionaries
  ln -Ts /usr/share/hyphen "$pkgdir"/opt/$pkgname/hyphenation

  # Use system certificates
  ln -sf /usr/lib/libnssckbi.so "$pkgdir"/opt/$pkgname/libnssckbi.so
}
