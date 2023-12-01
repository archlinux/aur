# Maintainer: Joan Figueras <ffigue@gmail.com>

_pkgname=pulse-browser
pkgname=${_pkgname}-bin
pkgver=1.0.0.alpha87
_pkgver=${pkgver/.alpha/-a.}
pkgrel=1
pkgdesc="An experimental Firefox fork that enhances focus and increases work productivity due to its Hyper minimalistic UI and built-in tools - Static binaries from upstream"
arch=('x86_64')
url="https://pulsebrowser.app/"
license=(MPL GPL LGPL)
depends=(gtk3 libxt mime-types dbus-glib nss ttf-font)
optdepends=('ffmpeg: H264/AAC/MP3 decoding'
            'networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
source=("pulse-browser.linux-${pkgver}.tar.bz2::https://github.com/pulse-browser/browser/releases/download/${_pkgver}/pulse-browser.linux.tar.bz2"
        $_pkgname.sh
        $_pkgname.desktop)
sha256sums=('cf6eed726850d52c9bdcd6eb7f6abff952d604fb7b348d44c7ff104403568df0'
            'c54e6e7f5554150dc1f7f000da3858ba45d68c0863ba15ca87f5f5c6d0fbf3ec'
            'f08bfb6733f936360b8808ae43dc5cdcf6afc9783c8e0321098c0b5caa16ffff')

package() {
  # Create directories
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/applications
  mkdir -p "$pkgdir"/opt

  # Install
  cp -r pulse-browser/ "$pkgdir"/opt/$pkgname

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
  #rm -r "$pkgdir"/opt/$_pkgname/dictionaries
  ln -Ts /usr/share/hunspell "$pkgdir"/opt/$pkgname/dictionaries
  ln -Ts /usr/share/hyphen "$pkgdir"/opt/$pkgname/hyphenation

  # Use system certificates
  #ln -sf /usr/lib/libnssckbi.so "$pkgdir"/opt/$pkgname/libnssckbi.so
}

