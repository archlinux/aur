# Maintainer: Luis Vervaet <luisvervaet@gmail.com>

pkgname=zen-twilight-avx2-bin
_pkgname=zen-twilight
_realpkgver=twilight
_desktopname=zen-twilight
pkgver=5aed1d0
pkgrel=1
pkgdesc="Unstable Nightly release of the Performance oriented Firefox-based web browser - Utilizes AVX2 for better performance"
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

source=("zen-browser-$_realpkgver.tar.bz2::https://github.com/zen-browser/desktop/releases/download/$_realpkgver/zen.linux-specific.tar.bz2"
        "$_pkgname.sh"
        "$_desktopname.desktop"
        "policies.json")
sha256sums=('SKIP'
            '41a3e5afe9bd278aa1614e0201aecdc82607d824021a28c181a6830f9627fcab'
            'e5fc10b93a545c7f09db87386bf8cd889f38fed03a348f1ddb48a13f15073bff'
            '4728b4aaec237d18a6ebf9331005fb1084ecf672075db8d4cdf1a503f3dd0c1e')

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
