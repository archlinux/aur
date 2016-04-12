# Maintainer: Antonio Rojas <nqn1976 @ gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: Andrew Wright <andreww@photism.org>

pkgname=nicotine
pkgver=1.2.16
pkgrel=7
pkgdesc='Soulseek music-sharing client, written in python'
arch=('x86_64' 'i686')
url='http://sourceforge.net/projects/nicotine-plus/'
license=('GPL')
depends=('pygtk' 'mutagen')
makedepends=('setconf')
optdepends=('python2-geoip: to enable Geographical blocker' 'python2-sexy: spell checking support' 'python2-miniupnpc: UPNP support')
source=("http://downloads.sourceforge.net/project/nicotine-plus/nicotine-plus/${pkgver}/${pkgname}+-${pkgver}.tar.bz2")
sha256sums=('71e5b33e273daaf072dbf63839536c14d7ead9d149323d50eee09f7429e34c1d')

prepare() {
  cd "$srcdir/${pkgname}+-$pkgver"

  # Fix for FS#22476
  setconf files/nicotine.desktop Icon nicotine-plus-32px

  # Python fix
  sed -i -e 's|/usr/bin/env python|/usr/bin/env python2|' \
    -e 's|/usr/bin/python|/usr/bin/python2|' pynicotine/{,gtkgui/}*.py
} 

build() {
  cd "$srcdir/${pkgname}+-$pkgver/trayicon"

  python2 autogen.py
  make 
}

package() {
  cd "$srcdir/${pkgname}+-$pkgver"

  python2 setup.py install --root="$pkgdir"
  cd trayicon
  make DESTDIR="$pkgdir" install 
  ln -s nicotine.py "$pkgdir/usr/bin/nicotine"
}

# vim:set ts=2 sw=2 et:
