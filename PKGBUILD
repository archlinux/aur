# Maintainer: Ada <adadonderr at gmail dot com>
# Contributor: Kieran <kieran at dothq dot co>
pkgname=dot-bin
_pkgname=dot
pkgver=87.0
pkgrel=0
pkgdesc="Dot Browser is a privacy-conscious web browser based on Firefox. (Binary)"
arch=("x86_64")
url="https://github.com/dothq/browser"
license=('MPL-2.0')
depends=(gtk3 libxt mime-types dbus-glib nss ttf-font)
optdepends=('ffmpeg: H264/AAC/MP3 decoding'
            'networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
provides=('dot')
replaces=('dot')
conflicts=('dot' 'dot-git')
source=("$_pkgname-$pkgver.tar.bz2::https://download.dothq.co/dot/releases/linux/x86/raw"
        "$_pkgname.desktop"
        "$_pkgname.sh")
sha256sums=('453a414b90fb0dfab47804c4164eb4922cce3f62cf305684d6a9556a5f137745'
            '646598d45de69426e660c7c43ce97c5b5104143ea190a6ec8e39477345030662'
            'ad3a13116d5dfd8241d57138c5355d258960b732204fae499f1f942a967a5ff7')

package() {
  # Create directories
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/applications
  mkdir -p "$pkgdir"/opt

  # Install
  cp -r dot/ "$pkgdir"/opt/$pkgname

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
}
