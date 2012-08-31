# Maintainer: Cedric Girard <girard.cedric@gmail.com>
# Contributor: Det <nimetonmaili at gmail a-dot com>
# Based on [extra]'s thunderbird

pkgname=thunderbird-nightly
pkgver=18.0a1
pkgrel=1
pkgdesc="Standalone Mail/News reader - Nightly build"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="http://www.mozilla.org/thunderbird"
depends=('alsa-lib' 'cairo' 'dbus-glib' 'desktop-file-utils' 'fontconfig' 'freetype2' 'gtk2' 'hicolor-icon-theme' 'hunspell' 'libevent' 'libjpeg' 'libmng' 'libpng' 'libvpx' 'libxt' 'mozilla-common' 'nspr' 'nss' 'shared-mime-info' 'sqlite' 'startup-notification')
optdepends=('libcanberra: for sound support')
provides=("thunderbird=$pkgver")
install=$pkgname.install
source=($pkgname.desktop
        vendor.js)
sha1sums=('9373c6b8e57692f62bac9f738351407ff27aa6f3'
          '4243393daf5bd5a68644034001f512178cad09cc')

package() {
  FX_SRC="thunderbird-${pkgver}.en-US.linux-${CARCH}.tar.bz2"
  FX_SRC_URI="http://ftp.mozilla.org/pub/mozilla.org/thunderbird/nightly/latest-comm-central/${FX_SRC}"

  msg "Downloading..."
  wget -N ${FX_SRC_URI}
  msg "Extracting..."
  bsdtar -x -f ${FX_SRC}
  msg "Packaging..."

  install -d "$pkgdir"/{usr/bin,opt}
  cp -a thunderbird "$pkgdir/opt/$pkgname-$pkgver"
  cp vendor.js "$pkgdir/opt/$pkgname-$pkgver/defaults/pref/"
  ln -s /opt/$pkgname-$pkgver/thunderbird "$pkgdir/usr/bin/$pkgname"
  for i in 16x16 22x22 24x24 32x32 48x48 256x256; do
      install -Dm644 thunderbird/chrome/icons/default/default${i/x*/}.png "$pkgdir/usr/share/icons/hicolor/$i/apps/$pkgname.png"
  done
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  rm -rf "$pkgdir/opt/$pkgname-$pkgver/dictionaries/"
  ln -sf /usr/share/hunspell/ "$pkgdir/opt/$pkgname-$pkgver/dictionaries"
}
