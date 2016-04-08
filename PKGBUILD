# Maintainer: halflife <pigoig_At_gmail_com>

pkgname=firefox-esr-zh-cn
_pkgname=firefox-esr
pkgver=45.0.2esr
pkgrel=1
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
sha512sums_i686=('1f7d0d91668e935fe4d0420a50447eb88bcffd241efc8f81a368fd96afc0b7697b642bc62da243f35c3dadc8b59a5303da3a1dbe0f015b719459ebaef50f3615')
sha512sums_x86_64=('7f4c391e3d677afbed55996c16de5741902e403d9b91d7a67a8bc46b6f18cc65ddbef6b9a1e73a971434fc6b538f8aeb719780ff6605f52ab162373e4a2539f9')

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
