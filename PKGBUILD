pkgname=mstpd
pkgver=0.04.r57.ga41b99cf0100
pkgrel=1
pkgdesc="User-space RSTP and MSTP daemon"
url="https://github.com/mstpd/mstpd"
arch=(i686 x86_64)
license=(GPL2)
source=(git+https://github.com/mstpd/mstpd.git
        mstpd.service)
sha256sums=('SKIP'
            '36c03f67ca55efc2822e2bec04d62c9f43417772b7a10effcf584664ff78227b')

pkgver() {
  cd "$pkgname"
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
  mkdir -p "$pkgdir/usr/bin"

  cd "$pkgname"
  make DESTDIR="$pkgdir" install

  cd "$srcdir"
  install -Dm 644 mstpd.service "$pkgdir/usr/lib/systemd/system/mstpd.service"
}

# vim: ft=sh:ts=2:sw=2:et
