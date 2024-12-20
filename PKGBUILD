# Maintainer: Edmund Lodewijks <e.lodewijks@gmail.com>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Yuuta Liang <yuuta@yuuta.moe>

pkgname=openbgpd
pkgver=8.7
pkgrel=1
pkgdesc="A FREE implementation of the Border Gateway Protocol, Version 4"
arch=(x86_64)
url="https://www.openbgpd.org"
license=('ISC')
depends=('libevent' 'libmnl')
source=(https://cdn.openbsd.org/pub/OpenBSD/OpenBGPD/openbgpd-${pkgver}.tar.gz{,.asc}
        bgpd.service
        sysusers.conf)
changelog=openbgpd.changelog
sha256sums=('b392cfa307e8880968714cbf9c09303c7df13540956ec6393f50db33aa890fdf'
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
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/openbgpd/LICENSE"
  install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/bgpd.conf"
  install -Dm644 "$srcdir/bgpd.service" "$pkgdir/usr/lib/systemd/system/bgpd.service"
  rm -rf "$pkgdir"/var
}
