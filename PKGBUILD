# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>

pkgname=libjpeg6-turbo
pkgver=1.4.1
pkgrel=1
pkgdesc="libjpeg derivative with accelerated baseline JPEG compression and decompression"
arch=('i686' 'x86_64')
url="http://libjpeg-turbo.virtualgl.org/"
license=('BSD')
depends=('glibc')
makedepends=('nasm')
provides=('libjpeg6')
conflicts=('libjpeg6')
options=('!libtool')
source=(http://sourceforge.net/projects/libjpeg-turbo/files/$pkgver/libjpeg-turbo-$pkgver.tar.gz)
md5sums=('b1f6b84859a16b8ebdcda951fa07c3f2')

build() {
  cd "$srcdir/libjpeg-turbo-$pkgver"

  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/libjpeg-turbo-$pkgver"

  make DESTDIR="$pkgdir/" install

  # Fix /usr/bin
  for fn in $pkgdir/usr/bin/*; do mv $fn ${fn}6; done
  # Fix /usr/lib
  rm $pkgdir/usr/lib/libturbojpeg.{a,so}*
  rm $pkgdir/usr/lib/libjpeg.{a,so}
  # Fix /usr/share/man
  for fn in $pkgdir/usr/share/man/man1/*; do mv $fn ${fn%.1}6.1; done
  # Fix /usr/include
  mkdir -p $pkgdir/usr/include/libjpeg6
  mv $pkgdir/usr/include/*.h $pkgdir/usr/include/libjpeg6
  mkdir -p $pkgdir/usr/share/doc/libjpeg6-turbo
  mv $pkgdir/usr/share/doc/{*.txt,README,*c} $pkgdir/usr/share/doc/libjpeg6-turbo
}

# vim:set ts=2 sw=2 et:
