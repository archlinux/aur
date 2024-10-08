# Maintainer: Luis Vervaet <luisvervaet@gmail.com>

pkgname=zen-twilight-bin
_pkgname=zen-twilight
_realpkgver=twilight
_desktopname=zen-twilight
pkgver=66fc824
pkgrel=1
pkgdesc="Performance oriented Firefox-based web browser (Unstable)"
arch=('x86_64' 'i686')
url="https://github.com/zen-browser/desktop"
license=(MPL-2.0)
depends=(gtk3 libxt mime-types dbus-glib nss ttf-font systemd)
optdepends=('ffmpeg: H264/AAC/MP3 decoding'
            'networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
options=(!strip)
provides=("zen-twilight=$pkgver")
conflicts=('zen-twilight')

source=("zen-browser-$_realpkgver.tar.bz2::https://github.com/zen-browser/desktop/releases/download/$_realpkgver/zen.linux-generic.tar.bz2"
        "$_pkgname.sh"
        "$_desktopname.desktop"
        "policies.json")
sha256sums=('4ca7cc582a9aebf778d247033d852905d3e5051ad33ed76f870c5510000a5352'
            'e0dcdb6b380933c8e81270a28a3c8d689265e8ed0c3af45f58ff388c2f8d7686'
            '9f4feeccb229c94a08d23055b92d7e8d5e36515b8026929259a37a26b0c43eda'
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
