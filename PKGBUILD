# Maintainer: Taiki Sugawara <buzz.taiki@gmail.com>
pkgname=xcruiser
pkgver=0.30
pkgrel=3
pkgdesc="Fly about 3D-formed file system"
arch=('i686' 'x86_64')
url="http://xcruiser.sourceforge.net/"
license=('GPL')
depends=(libx11 libxaw)
makedepends=(imake)
source=(https://prdownloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
        xcruiser.patch)
sha256sums=('917b68dc06389bfcdde742f0798f61cdeaea2ae3c6567960c33f7634d4861ce5'
            'ed69749f84b18fcb33d18e2bf982169c9a63b8d09376fcde70503386c1bf154d')


prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 < "$srcdir/xcruiser.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  xmkmf -a
  make XAPPLOADDIR=/usr/share/X11/app-defaults
  iconv -f EUC-JP -t UTF-8 README.jp > README.jp.utf8
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make install DESTDIR="$pkgdir/" XAPPLOADDIR=/usr/share/X11/app-defaults
  make install.man DESTDIR="$pkgdir/" XAPPLOADDIR=/usr/share/X11/app-defaults
  rm "$pkgdir"/usr/lib/X11/app-defaults
  rmdir "$pkgdir"/etc/X11/app-defaults

  install -D -m644 README $pkgdir/usr/share/doc/$pkgname/README
  install -D -m644 README.jp.utf8 $pkgdir/usr/share/doc/$pkgname/README.jp
}

# vim:set ts=2 sw=2 et:
