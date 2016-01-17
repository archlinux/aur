# Contributor: loserMcloser  <reebydobalina at gmail dot com>
# Contributor: Erik Johnson <palehose at gmail dot com>
# Contributor: Soup <soup a.t soultrap d.o.t n.e.t>
# Contributor: Michele Schäuble <mschaeuble@swissonline.ch>

pkgname=djmount
pkgver=0.71
pkgrel=5
_debpatch=7
pkgdesc="A UPnP AV client that mounts media server contents as a filesystem."
arch=('i686' 'x86_64')
url="http://djmount.sourceforge.net/"
license=('GPL')
depends=('fuse' 'libupnp' 'talloc')
source=(
  "http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz"
  "http://ftp.de.debian.org/debian/pool/main/d/$pkgname/${pkgname}_$pkgver-$_debpatch.debian.tar.xz"
  djmount.confd  djmount.service  djmount.tmpfilesd  djmount.install
)
install='djmount.install'
md5sums=('c922753e706c194bf82a8b6ca77e6a9a'
         'cee9b3cbf9dbea62afef72be3a631fd7'
         'c8315155d514a281388e096d10982033'
         'c3ead49b87f0c08ff6b9d9edb5deede2'
         'b516e86eb1afd044913a595804b7144f'
         '5913bb8387d4497a96117fba8f2b71f8')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < "$srcdir/debian/patches/000_djmount.1.diff"
  patch -p1 < "$srcdir/debian/patches/001-libupnp-1.6.6.diff"
  patch -p1 < "$srcdir/debian/patches/002-libupnp-1.6.13.diff"
  patch -p1 < "$srcdir/debian/patches/003-support-fstab-mounting.diff"
  patch -p1 < "$srcdir/debian/patches/004-avoid-crash-by-using-size_t.diff"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --with-external-talloc --with-external-libupnp --with-libupnp-prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
  install -D -m644 $srcdir/djmount.confd $pkgdir/etc/conf.d/djmount
  install -D -m644 $srcdir/djmount.service $pkgdir/usr/lib/systemd/system/djmount.service
  install -D -m644 $srcdir/djmount.tmpfilesd $pkgdir/usr/lib/tmpfiles.d/djmount.conf
  install -D -m644 "$srcdir/$pkgname-$pkgver/djmount.1" ${pkgdir}/usr/share/man/man1/djmount.1
}
