# Maintainer: halflife <pigoig_At_gmail_com>

pkgname=firefox-esr-zh-cn
_pkgname=firefox-esr
pkgver=45.0esr
build=build2
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
source_i686=("https://ftp.mozilla.org/pub/firefox/candidates/$pkgver-candidates/$build/linux-i686/zh-CN/firefox-$pkgver.tar.bz2")
source_x86_64=("https://ftp.mozilla.org/pub/firefox/candidates/$pkgver-candidates/$build/linux-x86_64/zh-CN/firefox-$pkgver.tar.bz2")
sha512sums=('66f7369d284191c100c5d1f06d942e3592047f5bfef9c2bc3a76be49b93712b6214928bcc22820888f0e97b94f12c6f6d6c3c1242bea39cd3a946715a2c4040b'
            'a42e7f11b6570151616dcbc9a9b5786636465786cffd9da28c46101b4d96d7dc6a21a03c31064958141a11fdc41da8b016d0b5d0ab4fcd064fdccf39745dd0d8')
sha512sums_i686=('e41cbda35a4559090c2f71326412d78f205ccd95975faefbe6543f0fe5b7881b9cbf16f5a7ecb655bd811321892412db404ddd97550b448c68a373478564a062')
sha512sums_x86_64=('d79e24900ccf2f1ddcb8a3b423aba7d86a5b9a16c6bc69f475e2553e76cb2bb8d2b17ae10524391e9a103ae04deb3bacc3cd9445170db02bb4ffab527b8d8c38')

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
