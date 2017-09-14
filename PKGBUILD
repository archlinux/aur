# Maintainer: Det <nimetonmaili g-mail>
# Contributors: Achilleas Pipinellis, speed145a, Schnouki

pkgname=firefox-beta-bin
_pkgname=firefox-beta
pkgver=56.0b12
_major=${pkgver/rc*}
_build=${pkgver/*rc}
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org - Beta"
arch=('i686' 'x86_64')
url="https://www.mozilla.org/en-US/firefox/channel/#beta"
license=('MPL' 'GPL' 'LGPL')
depends=('dbus-glib' 'gtk3' 'libxt' 'nss')
optdepends=('ffmpeg: H264/AAC/MP3 decoding'
            'libnotify: Notification integration'
            'networkmanager: Location detection via available WiFi networks'
            'pulseaudio'
            'upower: Battery API')
provides=("firefox=$pkgver")
install=$pkgname.install
source=("$pkgname.desktop")
source_i686=("https://ftp.mozilla.org/pub/firefox/releases/$pkgver/linux-i686/en-US/firefox-$pkgver.tar.bz2")
source_x86_64=("https://ftp.mozilla.org/pub/firefox/releases/$pkgver/linux-x86_64/en-US/firefox-$pkgver.tar.bz2")
# RC
if [[ $_build = ? ]]; then
  source_i686=("firefox-$pkgver.tar.bz2::https://ftp.mozilla.org/pub/firefox/candidates/$_major-candidates/build$_build/linux-i686/en-US/firefox-$_major.tar.bz2")
  source_x86_64=("firefox-$pkgver.tar.bz2::https://ftp.mozilla.org/pub/firefox/candidates/$_major-candidates/build$_build/linux-x86_64/en-US/firefox-$_major.tar.bz2")
fi
sha512sums=('865c832fe683f4ebeca7704058d56f834ec5d9d56391d31912cf4a928c56a268cf25064965cf8bbf935a45f638d0a8b24ffa744a47934e5ed8b8bb78883db4c0')
sha512sums_i686=('1a3b15bf8cb034bab27cb4f9f061c6b174e6007e9bd4c1e0d3b7f3184f2dcc5c439f1cd70d99d70ded2b3d0e5771aa58ab99cdbc4b61a86319b399284bf0a99a')
sha512sums_x86_64=('808b62f617a007c9cb2307c273f94901ee9dde4e824a28fa9dbbfeb9ca742eec64392263077fd0c728114d1c5725838cded776c3542da5d4d8f87a4dd3a33b26')

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