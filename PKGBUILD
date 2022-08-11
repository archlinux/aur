# Maintainer: T.J. Townsend <tj@openbsd.org>
# Contributor: Yuuta Liang <yuuta@yuuta.moe>

pkgname=openbgpd
pkgver=7.5
pkgrel=2
pkgdesc="A FREE implementation of the Border Gateway Protocol, Version 4"
arch=(x86_64)
url="https://www.openbgpd.org"
license=('ISC')
depends=(libevent)
source=(https://cdn.openbsd.org/pub/OpenBSD/OpenBGPD/openbgpd-${pkgver}.tar.gz{,.asc}
        bgpd.service
        sysusers.conf)
sha256sums=('67a81b3005cb23416b1c4842f1a1ed63a113c26ef1e91ce9ec0b90dcd5caffea'
            'SKIP'
            '374fbf93489ba8e5d8722c534e5c899a6c01601d5540423ac290fcc0fe6c77c6'
            '00165fa765f95ad0a99df2744401b7892384601f70a98d6d0097144cb55f9d68')
validpgpkeys=(BA3DA14FEE657A6D7931C08EC755429BA6A969A8) # Claudio Jeker

build() {
  cd "$pkgname-$pkgver"
  ./configure \
     --prefix=/usr \
     --sysconfdir=/etc/bgpd \
     --localstatedir=/var \
     --sbindir=/usr/bin \
     --with-privsep-user=bgpd
  make
}

check() {
  cd "$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/usr/share/licenses/openbgpd/"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/openbgpd/"
  mkdir -p "$pkgdir/usr/lib/sysusers.d/"
  install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/bgpd.conf"
  mkdir -p "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 "$srcdir/bgpd.service" "$pkgdir/usr/lib/systemd/system/bgpd.service"
}
