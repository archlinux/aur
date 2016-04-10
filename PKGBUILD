# Maintainer: nic96 <jeromyreimer at gmail dot com>

PKGEXT=.pkg.tar
pkgname=shotcut-bin
pkgver=160401
pkgrel=1
pkgdesc="A free, open source, cross-platform video editor."
arch=(x86_64)
url="http://www.mltframework.org/bin/view/Shotcut/WebHome"
license=('GPL3')
depends=('jack' 'libexif' 'desktop-file-utils' 'gstreamer0.10-base')
provides=('shotcut')
install="$pkgname.install"
source=("https://github.com/mltframework/shotcut/releases/download/v${pkgver::2}.${pkgver:2:2}/shotcut-debian7-x86${CARCH/*86}-$pkgver.tar.bz2"
       "shotcut.png")
md5sums=('cd15283c6e3dbdd40ae16d076b1d89d6' '457bc6ae5a299dee017521ec058e833b')


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
