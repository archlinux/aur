# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Ryan Farley <ryan.farley@gmx.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Krzysztof Stasiorowski <krzysiekst@gmail.com>

pkgname=qpxtool
pkgver=0.7.2
pkgrel=6
pkgdesc="Allows better controll over optical drives to include QChecks and optimization settings."
arch=('x86_64')
url="http://qpxtool.sourceforge.net/"
license=('GPL')
depends=('qt4')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2
	libpng15.patch)
md5sums=('b1235e74b8ef4fe087a6b64f5cfca14a'
         'ab9af7610277652c77c6d114422b2266')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  # Fix strict aliasing warnings
  export CFLAGS="$CFLAGS -fno-strict-aliasing"
  sed -i \
    -e 's|lib64|lib|' \
    -e 's|lrelease|lrelease-qt4|' \
    configure
  patch -p1 <"$srcdir"/libpng15.patch
  ./configure --prefix=/usr --sbindir=/usr/bin --qmake=/usr/lib/qt4/bin/qmake
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  mkdir -p "$pkgdir"/usr/bin
  make DESTDIR="$pkgdir" install
}
