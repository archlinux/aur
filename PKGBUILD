# Maintainer: Det <nimetonmaili g-mail>
# Contributors: Achilleas Pipinellis, speed145a, Schnouki

pkgname=firefox-bin
_pkgname=firefox
pkgver=61.0.1
_major=${pkgver/rc*}
_build=${pkgver/*rc}
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org - Release"
arch=('i686' 'x86_64')
url="https://www.mozilla.org/"
license=('MPL' 'GPL' 'LGPL')
depends=('dbus-glib' 'gtk3' 'libxt' 'nss')
optdepends=('ffmpeg: H264/AAC/MP3 decoding'
            'hunspell: Spell checking'
            'hyphen: Hyphenation'
            'libnotify: Notification integration'
            'networkmanager: Location detection via available WiFi networks'
            'pulseaudio: Sound'
            'upower: Battery API')
provides=("firefox=$pkgver")
conflicts=('firefox')
install=$pkgname.install
source=( "$_pkgname.sh"
        "$pkgname.desktop")
source_i686=("https://ftp.mozilla.org/pub/firefox/releases/$pkgver/linux-i686/en-US/firefox-$pkgver.tar.bz2")
source_x86_64=("https://ftp.mozilla.org/pub/firefox/releases/$pkgver/linux-i686/en-US/firefox-$pkgver.tar.bz2")
sha256sums=('fb7ffa69b4a7b133caec527d2ff5059280be8f4e6c6554a29cab1803761467df'
            '6ff746b8e6d642accc64cb31f173d75b5d069167c0511aa1ff5010540a6e1310')
sha256sums_i686=('3fcd3faf06280dc54bc4544a13d10d40f81d6ef5235624116e846c65000aad13')
sha256sums_x86_64=('3fcd3faf06280dc54bc4544a13d10d40f81d6ef5235624116e846c65000aad13')

package() {
  # Create directories
  msg2 "Creating directory structure..."
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/applications
  mkdir -p "$pkgdir"/opt

  msg2 "Moving stuff in place..."
  # Install
  cp -r firefox/ "$pkgdir"/opt/$_pkgname

  # Launchers
  install -m755 $_pkgname.sh "$pkgdir"/usr/bin/$_pkgname
  ln -s $_pkgname "$pkgdir"/usr/bin/$pkgname  # compatibility
  ln -sf firefox "$pkgdir"/opt/$_pkgname/firefox-bin

  # Desktops
  install -m644 *.desktop "$pkgdir"/usr/share/applications/

  # Icons
  for i in 16x16 32x32 48x48 64x64 128x128; do
    install -d "$pkgdir"/usr/share/icons/hicolor/$i/apps/
    ln -s /opt/$_pkgname/browser/chrome/icons/default/default${i/x*}.png \
          "$pkgdir"/usr/share/icons/hicolor/$i/apps/$_pkgname.png
  done

  # Use system-provided dictionaries
  rm -r "$pkgdir"/opt/$_pkgname/dictionaries
  ln -Ts /usr/share/hunspell "$pkgdir"/opt/$_pkgname/dictionaries
  ln -Ts /usr/share/hyphen "$pkgdir"/opt/$_pkgname/hyphenation

  # Use system certificates
  ln -sf /usr/lib/libnssckbi.so "$pkgdir"/opt/$_pkgname/libnssckbi.so
}
