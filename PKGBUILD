# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jarek Sedlacek <JarekSedlacek@gmail.com>
# Contributor: Erdbeerkaese <erdbeerkaese underscore arch at gmail dot com>

pkgname=sparkleshare
pkgver=0.8.4
pkgrel=3
pkgdesc="Collaboration and sharing tool based on git written in C Sharp"
arch=('any')
url="http://sparkleshare.org/"
license=('GPL3')
depends=('webkit-sharp' 'notify-sharp' 'curl' 'git' 'openssh' 'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('intltool' 'gnome-doc-utils' 'python2-nautilus')
optdepends=('python2-nautilus: Nautilus extension')
install=$pkgname.install
source=(https://github.com/downloads/hbons/SparkleShare/$pkgname-linux-$pkgver.tar.gz
        fix-event-log.patch
        fix-github-weblink.patch)
md5sums=('2e1ea43f47232d82d2c03c252c0238e5'
         '50bd9df0ebeeda784be503f2fdccc66e'
         '97b6f056c642f01c76fcf3297621166d')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # https://github.com/hbons/SparkleShare/issues/729
  patch -Np1 -i "$srcdir/fix-event-log.patch"

  # https://github.com/hbons/SparkleShare/issues/800
  patch -Np1 -i "$srcdir/fix-github-weblink.patch"

  # Python2 fix
  sed -i 's|#!/usr/bin/python|#!/usr/bin/python2|' SparkleShare/Linux/Nautilus/sparkleshare-nautilus3-extension.py.in

  # Build fix
  sed -i '/update-desktop-database/ d' SparkleShare/Makefile.in

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-appindicator
  make -j1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
