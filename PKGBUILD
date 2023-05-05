# Maintainer: Edmund Lodewijks <e.lodewijks@gmail.com>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Yuuta Liang <yuuta@yuuta.moe>

pkgname=openbgpd
pkgver=8.0
pkgrel=1
pkgdesc="A FREE implementation of the Border Gateway Protocol, Version 4"
arch=(x86_64)
url="https://www.openbgpd.org"
license=('ISC')
depends=(libevent)
source=(https://cdn.openbsd.org/pub/OpenBSD/OpenBGPD/openbgpd-${pkgver}.tar.gz{,.asc}
        bgpd.service
        sysusers.conf)
sha256sums=('cef83570f5f0c149f11152f0f9532efba42fb638c5e599813ba32ea6e002fd5c'
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
sha256sums=('cc67294642364e68c2ac708be6f8e8df67e2857aa15722ce924d6778f8bb6489'
            'SKIP'
            '374fbf93489ba8e5d8722c534e5c899a6c01601d5540423ac290fcc0fe6c77c6'
            '00165fa765f95ad0a99df2744401b7892384601f70a98d6d0097144cb55f9d68')
