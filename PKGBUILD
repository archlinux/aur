# Maintainer: halflife <pigoig_At_gmail_com>

pkgname=firefox-esr-zh-cn
_pkgname=firefox-esr
pkgver=45.0.1esr
pkgrel=2
pkgdesc="Chinese Simplified For Firefox ESR"
arch=('i686' 'x86_64')
url="https://www.mozilla.org/zh-CN/firefox/channel/#esr"
license=('MPL' 'GPL' 'LGPL')
depends=('alsa-lib' 'dbus-glib' 'desktop-file-utils' 'gtk2' 'gtk3' 'hicolor-icon-theme'
         'icu' 'libevent' 'libvpx' 'libxt' 'mime-types' 'nss' 'sqlite')
optdepends=('ffmpeg: additional video and audio decoders'
            'libpulse: PulseAudio driver'
            'networkmanager: Location detection via available WiFi networks'
            'upower: Battery API')
makedepends=('pacman>=4.2.0')
provides=("firefox=$pkgver")
install=$pkgname.install
source=("$pkgname.desktop"
        "vendor.js")
source_i686=("https://ftp.mozilla.org/pub/firefox/candidates/$pkgver-candidates/build$pkgrel/linux-i686/zh-CN/firefox-$pkgver.tar.bz2")
source_x86_64=("https://ftp.mozilla.org/pub/firefox/candidates/$pkgver-candidates/build$pkgrel/linux-x86_64/zh-CN/firefox-$pkgver.tar.bz2")
sha512sums=('SKIP'
            'SKIP')
sha512sums_i686=('6e228be0194aa9b0ee66aa02e8613f4735197421ed3dd40c0a10c7c3d9efc52d270ac219c171228d808d246e3cec8d6c1fe1f936875aea25f879be506d30d32c')
sha512sums_x86_64=('dcf62f76d7c664122a4ce9f35dcfcbd53ab3e9dec4a414251483f05b4223a8816cf0b307c52245e3575583ce7c9e0475279a5f4eceee03cdcae8dde0ce2fcdff')

package() {
  # Create directories
  msg2 "Creating directory structure..."
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/applications
  mkdir -p "$pkgdir"/usr/share/icons/hicolor/128x128/apps
  mkdir -p "$pkgdir"/opt

  msg2 "Moving stuff in place..."
  # Install
  rm -f firefox/update* firefox/icons/update*
  cp -r firefox/ "$pkgdir"/opt/$_pkgname

  # /usr/bin symlinks
  install -Dm644 ../vendor.js "$pkgdir/opt/$_pkgname/browser/defaults/preferences/vendor.js"
  ln -s /opt/$_pkgname/firefox "$pkgdir"/usr/bin/$_pkgname
  ln -s /opt/$_pkgname/firefox "$pkgdir"/usr/bin/$pkgname  # compatibility

  # Desktops
  install -m644 *.desktop "$pkgdir"/usr/share/applications/

  # Icons
  for i in 16x16 22x22 24x24 32x32 48x48 256x256; do
    install -d "$pkgdir"/usr/share/icons/hicolor/$i/apps/
    ln -s /opt/$_pkgname/browser/chrome/icons/default/default${i/x*}.png \
          "$pkgdir"/usr/share/icons/hicolor/$i/apps/$_pkgname.png
  done

  # 128x128
  ln -s /opt/$_pkgname/browser/icons/mozicon128.png \
        "$pkgdir"/usr/share/icons/hicolor/128x128/apps/$_pkgname.png
}
