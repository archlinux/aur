# Maintainer: halflife <pigoig_At_gmail_com>

pkgname=firefox-beta-zh-cn
_pkgname=firefox-beta
pkgver=46.0b8
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
sha512sums_i686=('a901d4953dabdc20877d92005de63b2495c92ebdcdedcc6db1237b9c639c6e59869479c41f3b2b2d41ade215955593a84a1771c8df2d3fa9e998de24ba1ad9df')
sha512sums_x86_64=('2e3b32026e60dc172aae786e839ce737b2f4e51be4b74036cc6ee967209d3784af7b8bab226e3c9ff720eb4551ad722ed63f566c08e4efd9f93ccea384db4f21')

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
