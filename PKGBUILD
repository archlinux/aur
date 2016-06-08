pkgname=mstpd
pkgver=0.04.r38.g01b7f47
pkgrel=1
pkgdesc="User-space RSTP and MSTP daemon"
arch=(i686 x86_64)
license=(GPL2)
source=(git+https://github.com/ocedo/mstpd.git mstpd.service)
sha256sums=('SKIP'
            '36c03f67ca55efc2822e2bec04d62c9f43417772b7a10effcf584664ff78227b')

pkgver() {
  cd "$pkgname"
  git tag -f v0.03 8b24d0260652357709cda159b45b0b58a2545e9e
  git tag -f v0.04 61728c9ecaf40f787cd1994be15f41a91df8986a
  git describe --tags | sed 's/^v//; s/-/.r/; s/-/./'
}

prepare() {
  cd "$pkgname"
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "$pkgname"
  ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install

  cd "$srcdir"
  install -Dm 644 mstpd.service "$pkgdir/usr/lib/systemd/system/mstpd.service"
}

# vim: ft=sh:ts=2:sw=2:et
