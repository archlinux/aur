# Maintainer: Alexey Peschany <archlinux at sandboiii dot xyz>

_pkgname=mercury-browser
pkgname=${_pkgname}-bin
pkgver=112.0.2
pkgrel=1
pkgdesc="Firefox fork with compiler optimizations and patches from Librewolf, Waterfox, and GNU IceCat."
arch=('x86_64')
url="https://thorium.rocks/mercury"
license=('MPL' 'GPL' 'LGPL')
depends=('dbus-glib' 'gtk3' 'libxt' 'nss')
optdepends=('ffmpeg: H264/AAC/MP3 decoding'
            'hunspell: Spell checking'
            'hyphen: Hyphenation'
            'libnotify: Notification integration'
            'networkmanager: Location detection via available WiFi networks'
            'pulseaudio: Sound'
            'upower: Battery API')
source=("https://github.com/Alex313031/Mercury/releases/download/v.112.0.3/Mercury-$pkgver.en-US.linux-x86_64.tar.bz2"
        "$_pkgname.sh"
        "$_pkgname.desktop")
sha256sums=('d7d439bf91d454c6884865f843058cace96d28ee7874fad3d41f8a7f2a85c027'
            '3e70b82d2f477d5d032338a3c66a3ececaaaf5bf606ab5f5d018321a6fb6afab'
            '8370ee50614115b06e0f8fa96dfbc2db80e2b9ab41368bf9b4ba42fb8ded9982')

package() {
  # Create directories
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/applications
  mkdir -p "$pkgdir"/opt

  # Install
  cp -r mercury/ "$pkgdir"/opt/$_pkgname

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
