# Maintainer: Det <nimetonmaili g-mail>
# Contributors: Achilleas Pipinellis, speed145a, Schnouki

pkgname=firefox-beta-bin
_pkgname=firefox-beta
pkgver=52.0b1
_major=${pkgver/rc*}
_build=${pkgver/*rc}
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org - Beta"
arch=('i686' 'x86_64')
url="https://www.mozilla.org/en-US/firefox/channel/#beta"
license=('MPL' 'GPL' 'LGPL')
depends=('alsa-lib' 'dbus-glib' 'desktop-file-utils' 'gtk2' 'gtk3' 'hicolor-icon-theme'
         'icu' 'libevent' 'libvpx' 'libxt' 'mime-types' 'nss' 'sqlite' 'pulseaudio')
optdepends=('ffmpeg: H264/AAC/MP3 decoding'
            'libpulse: PulseAudio driver'
            'networkmanager: Location detection via available WiFi networks'
            'upower: Battery API')
provides=("firefox=$pkgver")
install=$pkgname.install
source=("$pkgname.desktop"
        "$pkgname-safe.desktop")
source_i686=("https://ftp.mozilla.org/pub/firefox/releases/$pkgver/linux-i686/en-US/firefox-$pkgver.tar.bz2")
source_x86_64=("https://ftp.mozilla.org/pub/firefox/releases/$pkgver/linux-x86_64/en-US/firefox-$pkgver.tar.bz2")
# RC
if [[ $_build = ? ]]; then
  source_i686=("https://ftp.mozilla.org/pub/firefox/candidates/$_major-candidates/build$_build/linux-i686/en-US/firefox-$_major.tar.bz2")
  source_x86_64=("https://ftp.mozilla.org/pub/firefox/candidates/$_major-candidates/build$_build/linux-x86_64/en-US/firefox-$_major.tar.bz2")
fi
sha512sums=('702359fd891da5ac3b24124a328f70bac3034e9bbb33c1eb00da15420825ce3e13cf62bfdf5fe2ef9cc876a0e533422d7989af62e966123a21171293e5e4fa14'
            '776fccb247711d33621605dd0807c03528ffd0f9bc14f20b4f60f344589c1aad62e9377c22bcf583066c8c600cd86bf9db5b48e2c44924cd48a48c1c4a9c39a0')
sha512sums_i686=('8d61abd5f653780ab3c93c4f761ba61b7d953d6a4fa806cf24dcc2f0c0df6d1ccee13d6c81b66145cdfb3747b7ab989adb5046825ece76f1a3a425abe1b0a04f')
sha512sums_x86_64=('ac1c50b0b8646445006a1cd5b29739c96926a325a70bd8af78449f2ad83b8cd483a207a01a95607788a4a662e758a7997e7f49e59a5542c78a33d954c26738d7')

package() {
  # Create directories
  msg2 "Creating directory structure..."
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/applications
  mkdir -p "$pkgdir"/usr/share/icons/hicolor/128x128/apps
  mkdir -p "$pkgdir"/opt

  msg2 "Moving stuff in place..."
  # Install
  cp -r firefox/ "$pkgdir"/opt/$_pkgname

  # /usr/bin symlinks
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
