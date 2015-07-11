# Maintainer: nic96 <jeromyreimer at gmail dot com>

PKGEXT=.pkg.tar
pkgname=shotcut-bin
pkgver=150702
pkgrel=1
pkgdesc="A free, open source, cross-platform video editor."
arch=(i686 x86_64)
url="http://www.mltframework.org/bin/view/Shotcut/WebHome"
license=('GPL3')
depends=('jack' 'libexif' 'desktop-file-utils' 'gstreamer0.10-base')
provides=('shotcut')
install="$pkgname.install"
source=("https://github.com/mltframework/shotcut/releases/download/v${pkgver::2}.${pkgver:2:2}/shotcut-debian7-x86${CARCH/*86}-$pkgver.tar.bz2"
       "shotcut.png")
if [[ $CARCH = 'x86_64' ]]
then
    md5sums=('3ac4061c43348f5f2326b96ae93ba3b3' '457bc6ae5a299dee017521ec058e833b')
else
    md5sums=('dfe2ff87e437afe398a7169bd3c425bc' '457bc6ae5a299dee017521ec058e833b')
fi


prepare() {
  cd Shotcut
  # fix and modify desktop file
  sed -i '1d;/Exec/s/sh.*/shotcut-bin/' Shotcut.desktop
  sed -i 's/Icon=applications-multimedia/Icon=shotcut/g' Shotcut.desktop
  echo "Categories=Qt;AudioVideo;AudioVideoEditing;" >> Shotcut.desktop
}

package() {
  cd Shotcut

  # bundle
  install -d "$pkgdir/opt/shotcut"
  cp -a Shotcut.app/* "$pkgdir/opt/shotcut"

  # desktop file
  install -Dm644 Shotcut.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  
  # shotcut icon
  install -Dm644 "$srcdir/shotcut.png" "$pkgdir/usr/share/pixmaps/shotcut.png"

  # launcher
  install -d "$pkgdir/usr/bin"
  ln -s /opt/shotcut/shotcut "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
