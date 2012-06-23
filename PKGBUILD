# $Id: PKGBUILD 157114 2012-04-24 00:17:20Z stephane $
# Maintainer: Marti Raudsepp <marti@juffo.org>

pkgname=python16
pkgver=1.6.1
pkgrel=1
pkgdesc="Yes, an ancient version of Python, lol"
arch=('i686' 'x86_64')
license=('PSF')
url="http://www.python.org/"
depends=('bash')
makedepends=(tk tcl)
optdepends=()
options=('!makeflags')
source=(http://www.python.org/download/releases/$pkgver/Python-$pkgver.tar.gz)
sha1sums=('3cc7f523ae529384ea78b41d1c48011484407442')

build() {
  cd "$srcdir/Python-$pkgver"

  # enable more modules
  echo 'termios termios.c' >> Modules/Setup.in
  echo 'crypt cryptmodule.c -lcrypt' >> Modules/Setup.in
  echo 'resource resource.c' >> Modules/Setup.in
  echo '_tkinter _tkinter.c tkappinit.c -DWITH_APPINIT -lX11 -ltk8.5 -ltcl8.5' >> Modules/Setup.in

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
