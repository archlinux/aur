# Maintainer: halflife <pigoig_At_gmail_com>

pkgname=firefox-esr-zh-cn
_pkgname=firefox-esr
pkgver=45.0.2esr
pkgrel=3
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
_baseurl="https://ftp.mozilla.org/pub/firefox/candidates/$pkgver-candidates/build$pkgrel/linux-${CARCH}/zh-CN/"
_filename="firefox-$pkgver"
_sha512sum="$(curl -s "${_baseurl}${_filename}.checksums" | grep "${_filename}.tar.bz2" | grep sha512 | cut -d " " -f1)"
source=("$pkgname.desktop"
        "vendor.js"
        "${_baseurl}${_filename}.tar.bz2")
sha512sums=('SKIP'
            'SKIP'
            "${_sha512sum}")

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
