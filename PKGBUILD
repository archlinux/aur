# Maintainer: Alexey Peschany <archlinux at sandboiii dot xyz>

_pkgname=mercury-browser
pkgname=${_pkgname}-bin
pkgver=110.0a1 
pkgrel=1
pkgdesc="The fastest Firefox fork on Earth with compiler optimizations and patches from Librewolf, Waterfox, and GNU IceCat."
arch=('x86_64')
url="https://github.com/Alex313031/Mercury"
license=('MPL' 'GPL' 'LGPL')
depends=('dbus-glib' 'gtk3' 'libxt' 'nss')
optdepends=('ffmpeg: H264/AAC/MP3 decoding'
            'hunspell: Spell checking'
            'hyphen: Hyphenation'
            'libnotify: Notification integration'
            'networkmanager: Location detection via available WiFi networks'
            'pulseaudio: Sound'
            'upower: Battery API')
source=("https://github.com/Alex313031/Mercury/releases/download/v.$pkgver/Mercury-$pkgver.en-US.linux-x86_64.tar.bz2"
        "$_pkgname.sh"
        "$_pkgname.desktop")
sha256sums=('63e327b78b6688b1c0482f4b927027e2d358aa68182cc8eaa8b70d56796d4228'
            '60955647fd96fff4d16dd77278d845c8205b00dcb37fbad3bd3d362aa013602b'
            '8370ee50614115b06e0f8fa96dfbc2db80e2b9ab41368bf9b4ba42fb8ded9982')

package() {
  # Create directories
  msg2 "Creating directory structure..."
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/applications
  mkdir -p "$pkgdir"/opt

  msg2 "Moving stuff in place..."
  # Install
  cp -r Mercury/ "$pkgdir"/opt/$_pkgname

  # Launchers
  install -m755 $_pkgname.sh "$pkgdir"/usr/bin/$_pkgname
  ln -s $_pkgname "$pkgdir"/usr/bin/$pkgname  # compatibility

  # Desktops
  install -m644 *.desktop "$pkgdir"/usr/share/applications/

  # Icons
  for i in 16x16 32x32 48x48 64x64 128x128; do
    install -d "$pkgdir"/usr/share/icons/hicolor/$i/apps/
    ln -s /opt/$_pkgname/browser/chrome/icons/default/default${i/x*}.png \
          "$pkgdir"/usr/share/icons/hicolor/$i/apps/$_pkgname.png
  done

  # Use system-provided dictionaries
  #rm -r "$pkgdir"/opt/$_pkgname/dictionaries
  ln -Ts /usr/share/hunspell "$pkgdir"/opt/$_pkgname/dictionaries
  ln -Ts /usr/share/hyphen "$pkgdir"/opt/$_pkgname/hyphenation

  # Use system certificates
  ln -sf /usr/lib/libnssckbi.so "$pkgdir"/opt/$_pkgname/libnssckbi.so
}
