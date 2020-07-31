# Maintainer: spikecodes <19519553+spikecodes@users.noreply.github.com>
pkgname=peafox
pkgver=79.0.1
pkgrel=0.2
upload_hash="2fc539675e0fd2a1e53c26e0ae042b2f"
pkgdesc="Firefox fork hardened by default and without the telemetry."
arch=('x86_64')
url="https://gitlab.com/spikecodes/peafox"
license=('MPL' 'GPL' 'LGPL')
depends=('dbus-glib' 'gtk3' 'libxt' 'nss')
optdepends=('ffmpeg: H264/AAC/MP3 decoding'
            'hunspell: Spell checking'
            'hyphen: Hyphenation'
            'libnotify: Notification integration'
            'networkmanager: Location detection via available WiFi networks'
            'pulseaudio: Sound'
            'upower: Battery API')
provides=("peafox=$pkgver")
conflicts=('peafox')
source=("https://gitlab.com/spikecodes/peafox/uploads/$upload_hash/$pkgname-$pkgver.tar.bz2"
        "peafox.desktop"
        "peafox.png"
        "peafox.sh")
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

package() {
  # Create directories
  msg2 "Creating directory structure..."
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share
  mkdir -p "$pkgdir"/usr/share/applications

  msg2 "Moving files in place..."
  # Install
  cp -r peafox/ "$pkgdir"/usr/share/$pkgname

  msg2 "Creating executable..."
  # Launchers
  install -m755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  # ln -s $pkgname "$pkgdir"/usr/bin/$pkgname  # compatibility
#  ln -sf firefox "$pkgdir"/usr/share/$pkgname/firefox-bin

  msg2 "Adding to application list..."
  # Desktops
  install -m644 *.desktop "$pkgdir"/usr/share/applications/

  msg2 "Installing icons..."
  # Icons
  for i in 16x16 32x32 48x48 64x64 128x128; do
    install -d "$pkgdir"/usr/share/icons/hicolor/$i/apps/
    ln -s /usr/share/$pkgname/browser/chrome/icons/default/default${i/x*}.png \
          "$pkgdir"/usr/share/icons/hicolor/$i/apps/$pkgname.png
  done

  # Use system-provided dictionaries
  # rm -r "$pkgdir"/usr/share/$pkgname/dictionaries
  # ln -Ts /usr/share/hunspell "$pkgdir"/usr/share/$pkgname/dictionaries
  # ln -Ts /usr/share/hyphen "$pkgdir"/usr/share/$pkgname/hyphenation

  # Use system certificates
  # ln -sf /usr/lib/libnssckbi.so "$pkgdir"/usr/share/$pkgname/libnssckbi.so
}