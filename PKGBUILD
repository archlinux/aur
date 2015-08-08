# Maintainer: Mantas M. <grawity@gmail.com>
pkgname=nis-utils
pkgver=1.4.1
pkgrel=2
pkgdesc="Linux NIS+ Tools"
arch=("i686" "x86_64")
url="http://www.linux-nis.org/nisplus/nis-utils/"
license=("GPL2")
# gmp with --enable-mpbsd
depends=("bsd-mp")
source=("ftp://ftp.kernel.org/pub/linux/utils/net/NIS+/$pkgname-$pkgver.tar.gz"
        "0001-passwd2des.patch"
        "0002-nisbind.patch"
        "keyserv.service"
        "nis-cachemgr.service"
        "rpc-nisd.service"
        "rpc-nispasswdd.service")
sha1sums=('7180e56a536311421a04c8ecad9ee12c41a6004f'
          '216b6ab9d3a683c2f251b0efed1d03e22d1582f1'
          'e3043e9c01b2044866fd6d4e0b350312cfb152dd'
          '6c05c54938d07461bba133fccfcc994a23bd6d68'
          '6484c2b3dbb1ce80c3519da61eb1ffdd904142bb'
          'fe14ae25258b401ea83f2d8f68644f626584a742'
          'c393da32cc15584de7c2d124e2a3ef4ab7cf1d70')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  rm -f "src/keyserv/passwd2des.c"
  patch -p1 < "$srcdir/0001-passwd2des.patch"
  patch -p1 < "$srcdir/0002-nisbind.patch"

  ./configure \
    --prefix=/usr       \
    --sbindir=/usr/bin  \
    --sysconfdir=/etc   \
    ;
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  cd "$srcdir"
  for unit in *.service; do
    install -Dm0644 "$unit" "$pkgdir/usr/lib/systemd/system/$unit"
  done
}

# vim: ts=2:sw=2:et:ft=sh
