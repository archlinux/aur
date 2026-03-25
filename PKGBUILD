# Maintainer: 0b100100 <0b100100 at protonmail dot ch>
# Contributor: Phillip Smith <pkgbuild@phs.id.au>
# Contributor: gregor <gregor@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=dump
pkgver=0.4b54
pkgrel=1
pkgdesc="Dump/Restore ext2/3/4 filesystem backup"
arch=('i686' 'x86_64')
url="http://dump.sourceforge.net"
license=('BSD')
depends=('util-linux-libs' 'zlib' 'bzip2' 'lzo' 'readline' 'ncurses' 'e2fsprogs')
makedepends=('util-linux' 'sqlite' 'openssl')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('89bc99f6f1589348065a0923f5e1e3d904ec06d04d54a557bdd3285e27fa3f470fbf1835d0b499e954b3e2dc1e85eb2576617b9d2fdd886d234adadad335f1ac')

build() {
  cd "$pkgname-$pkgver"
  ./configure \
    --prefix=/usr \
    --sbindir='${exec_prefix}/bin' \
    --sysconfdir=/etc \
    --disable-rmt \
    --disable-selinux
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
  # Avoid conflict with tar
  mv -v "$pkgdir"/usr/bin/restore{,.dump}
  mv -v "$pkgdir"/usr/share/man/man8/restore{,.dump}.8
  ln -vnsf restore.dump "$pkgdir"/usr/bin/rrestore
}

# vim:set ts=2 sw=2 et:
