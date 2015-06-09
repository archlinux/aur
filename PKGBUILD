# Maintainer: Erik Johnson <palehose at gmail dot com>
# Maintainer: Soup <soup a.t soultrap d.o.t n.e.t>
# Contributor: Michele Schäuble <mschaeuble@swissonline.ch>

pkgname=djmount
pkgver=0.71
pkgrel=4
_debpatch=3
pkgdesc="A UPnP AV client that mounts media server contents as a filesystem."
arch=('i686' 'x86_64')
url="http://djmount.sourceforge.net/"
license=('GPL')
depends=('fuse' 'libupnp' 'talloc')
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz"
        "http://ftp.de.debian.org/debian/pool/main/d/$pkgname/${pkgname}_$pkgver-$_debpatch.diff.gz"
        'djmount.rcd'
        'djmount.confd'
        'libupnp-1.6.9-JonimusPrime.diff')
md5sums=('c922753e706c194bf82a8b6ca77e6a9a'
         '00c5b6df865c8ffcd29b37de6f5503bf'
         'f473b5150df385447f2f58049bfb6199'
         '21de4c947c17e8558f1007a20757f254'
         'c5c86bef5573dada1d1cd38b64b557c8')

build() {
  cd $srcdir
  patch -p0 < "${pkgname}_$pkgver-$_debpatch.diff"
  patch -p0 < "$pkgname-$pkgver/debian/patches/000_djmount.1.diff"
  patch -p0 < "$pkgname-$pkgver/debian/patches/001-libupnp-1.6.6.diff"
  patch -p0 < "$srcdir/libupnp-1.6.9-JonimusPrime.diff"

  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --with-external-talloc --with-external-libupnp --with-libupnp-prefix=/usr
  make
  make DESTDIR=$pkgdir install

  install -D -m755 $srcdir/djmount.rcd $pkgdir/etc/rc.d/djmount
  install -D -m644 $srcdir/djmount.confd $pkgdir/etc/conf.d/djmount
  install -D -m644 "$srcdir/$pkgname-$pkgver/djmount.1" ${pkgdir}/usr/share/man/man1/djmount.1
}
