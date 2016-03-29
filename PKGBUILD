# Maintainer: halflife <pigoig_At_gmail_com>

pkgname=firefox-beta-zh-cn
_pkgname=firefox-beta
pkgver=46.0b6
pkgrel=1
pkgdesc="Chinese Simplified For Firefox Beta"
arch=('i686' 'x86_64')
url="https://www.mozilla.org/zh-CN/firefox/channel/#beta"
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
sha512sums_i686=('b3fa6ffee91f3197aee1e9259ad3c0a06d00a729a8b87644679703310379ab78bdf38ba30eac9360ef88103a69a5f6b9aba9e50940a9d730cc54251d481dfe87')
sha512sums_x86_64=('adc2c752ba90b29de420112ec5b808b11780e5ae4b99a9097f5306d5381c968667e95e7dc4a8dc389ac2540b38ff53228a46ad00c5242693d144be489a9a7f07')

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
