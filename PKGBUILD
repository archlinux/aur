# Maintainer: 0b100100 <0b100100 at protonmail dot ch>
# Contributor: Phillip Smith <pkgbuild@phs.id.au>
# Contributor: gregor <gregor@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=dump
pkgver=0.4b55
pkgrel=1
pkgdesc="Dump/Restore ext2/3/4 filesystem backup"
arch=('i686' 'x86_64')
url="http://dump.sourceforge.net"
license=('BSD')
depends=('util-linux-libs' 'zlib' 'bzip2' 'lzo' 'readline' 'ncurses' 'e2fsprogs')
makedepends=('util-linux' 'sqlite' 'openssl')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz"
        "gcc15-const.patch")
sha512sums=('a4dfe96a1431f06432324980a8d54c7f6ca55f082cf4fe3ebdecde022626b1934824607f745c90e1a1c34a229ef3d35f3f24ed74feed17f46c2d227c4c7b85f7'
            '3403eaabecf5c50807faf8fb42a83d832053bc36c09cd2de4a153c19f2b44d3c1c559b72e6308eff5c7c3792e1638aea0a7f09433a7eaf31625f879165c61025')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i "../gcc15-const.patch"
}

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
