# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Shahar Weiss <sweiss4@gmx.net>

pkgname=torcs
pkgver=1.3.7
pkgrel=2
pkgdesc="A 3D racing cars simulator using OpenGL"
url="http://torcs.sourceforge.net"
license=("GPL")
arch=('x86_64')
depends=('freeglut' 'libpng' 'freealut' 'libxi' 'libxmu' 'libxrandr' 'libvorbis' 'glu')
makedepends=('plib' 'mesa')
options=('!makeflags')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-${pkgver/_/-}.tar.bz2
	build-fix.patch)
md5sums=('de314c3e421e8d7d4323d819c5010d23'
         'e011b533142879b1a399ce1cdeb1772c')

prepare() {
  cd "$srcdir"/$pkgname-${pkgver/_/-}
  patch -p1 <"$srcdir"/build-fix.patch
}

build() {
  cd "$srcdir"/$pkgname-${pkgver/_/-}
  unset LDFLAGS
  ./configure --prefix=/usr --x-includes=/usr/include --x-libraries=/usr/lib
  make
}

package() {
  depends=(${depends[@]} "torcs-data=$pkgver")
  cd "$srcdir"/$pkgname-${pkgver/_/-}
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" datainstall
  install -D -m644 Ticon.png "$pkgdir"/usr/share/pixmaps/torcs.png
  install -D -m644 torcs.desktop "$pkgdir"/usr/share/applications/torcs.desktop
  find "$pkgdir" -type d -exec chmod 755 {} \;
}
