# Maintainer: Jooch <jooch at gmx dot com>

pkgname=firefox-fuckpa
_pkgname=firefox
pkgver=86.0
pkgrel=1
pkgdesc="Standalone web browser from mozilla - unofficial prebuilt binary with ALSA support"
arch=('x86_64')
url="https://submarine.strangled.net/fuckpa/"
license=(MPL GPL LGPL)
depends=(gtk3 libxt mime-types dbus-glib nss ttf-font)
optdepends=('ffmpeg: H264/AAC/MP3 decoding'
            'networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
options=(!strip)
provides=("firefox=$pkgver")
conflicts=('firefox')
source=(https://submarine.strangled.net/fuckpa/files/$pkgver/firefox-$pkgver.en-US.linux-x86_64.tar.bz2
        $_pkgname.sh
        $_pkgname.desktop)
sha256sums=('4f566e699d3aaf2785a1ca76c850ee66a46abce74dcbec0fcdee67bee9e81db4'
            '28b60250540353e1732ec1a9aad53ff55cd681927516e65c51e3543532bc25af'
            '94140a523273eaf957ad0e67145d8997556ca1c37a2cc1f5b699a9b5d7ac8f7d')
#validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353') # Mozilla Software Releases <release@mozilla.com>

package() {
  # Create directories
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/applications
  mkdir -p "$pkgdir"/opt

  # Install
  cp -r firefox/ "$pkgdir"/opt/$pkgname

  # Launchers
  install -m755 $_pkgname.sh "$pkgdir"/usr/bin/$_pkgname

  # Desktops
  install -m644 *.desktop "$pkgdir"/usr/share/applications/

  # Icons
  #for i in 16x16 32x32 48x48 64x64 128x128; do
  #  install -d "$pkgdir"/usr/share/icons/hicolor/$i/apps/
  #  ln -s /opt/$pkgname/browser/chrome/icons/default/default${i/x*}.png \
  #        "$pkgdir"/usr/share/icons/hicolor/$i/apps/$_pkgname.png
  #done

  # Use system-provided dictionaries
  #rm -r "$pkgdir"/opt/$_pkgname/dictionaries
  ln -Ts /usr/share/hunspell "$pkgdir"/opt/$pkgname/dictionaries
  ln -Ts /usr/share/hyphen "$pkgdir"/opt/$pkgname/hyphenation

  # Use system certificates
  ln -sf /usr/lib/libnssckbi.so "$pkgdir"/opt/$pkgname/libnssckbi.so
}
