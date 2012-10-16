# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jarek Sedlacek <JarekSedlacek@gmail.com>
# Contributor: Erdbeerkaese <erdbeerkaese underscore arch at gmail dot com>

pkgname=sparkleshare
pkgver=0.9.3
pkgrel=2
pkgdesc="Collaboration and sharing tool based on git written in C Sharp"
arch=('any')
url="http://sparkleshare.org/"
license=('GPL3')
depends=('webkit-sharp' 'notify-sharp' 'curl' 'git' 'openssh' 'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('intltool' 'gnome-doc-utils' 'python2-nautilus')
optdepends=('python2-nautilus: Nautilus extension')
install=$pkgname.install
source=(https://github.com/downloads/hbons/SparkleShare/$pkgname-linux-$pkgver.tar.gz
        fix-crash.patch)
md5sums=('58d1f5141385bad13cc004d32b095eef'
         '51ec7e3c090be69864f95227fd7abae6')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # https://github.com/hbons/SparkleShare/issues/965
  patch -Np1 -i "$srcdir/fix-crash.patch"

  # Python2 fix
  sed -i 's|#!/usr/bin/python|#!/usr/bin/python2|' SparkleShare/Linux/Nautilus/sparkleshare-nautilus3-extension.py.in

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-appindicator
  make -j1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
