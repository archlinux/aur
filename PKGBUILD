# $Id: PKGBUILD 157114 2012-04-24 00:17:20Z stephane $
# Maintainer: Marti Raudsepp <marti@juffo.org>

pkgname=python15
pkgver=1.5.2
pkgrel=1
pkgdesc="Yes, an ancient version of Python, lol"
arch=('i686' 'x86_64')
license=('PSF')
url="http://www.python.org/"
depends=('bash')
makedepends=()
optdepends=()
options=('!makeflags')
source=(http://www.python.org/ftp/python/src/py152.tgz getline.patch)
sha1sums=('2d648d07b1aa1aab32a3a24851c33715141779b9'
          '4a7b8064f7e6eebd398694bc7c373b700b2e5535')

build() {
  cd "$srcdir/Python-$pkgver"

  patch -p1 < $srcdir/getline.patch

  export OPT="$CFLAGS"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/Python-$pkgver"
  mkdir "$pkgdir/usr"
  # Makefile doesn't understand DESTDIR
  make INSTALL=install prefix="$pkgdir/usr" install

  # Hack fix
  rm "$pkgdir/usr/bin/python"
  rm -r "$pkgdir/usr/man"

  # Dunno why these have wrong mode... Easier to just work around :)
  chmod 755 "$pkgdir/usr"/{bin,lib,include}
}
