# Maintainer: Stephan Springer <buzo+arch@Lini.de>

pkgname=chaosvpn
pkgver=2.22
pkgrel=1
pkgdesc="Configuration generator for ChaosVPN"
arch=('i686' 'x86_64')
url='https://wiki.hamburg.ccc.de/ChaosVPN'
license=('Apache')
makedepends=('flex')
depends=('tinc' 'iproute2')
backup=('etc/tinc/chaosvpn.conf' 'etc/tinc/warzone.conf')

source=("$pkgname-$pkgver.tar.gz::https://github.com/ryd/chaosvpn/archive/v$pkgver.tar.gz"
        iproute2-chaosvpn.patch
        iproute2-warzone.patch
        chaosvpn.service)
sha256sums=('631394284d30b24a8b6e1be26b0ea1321b191fb30458b1f5ef01cb4c91c1ecf2'
            '4c975e57867aae2291f4dfe2c024f8b98907ec8f83345672ee0641700da433a8'
            'b7baf5d649c7acf09f3afbc91097caaa8fbe762b212fd47adc88d330e9dfa102'
            'bb00812aa6fd254f495aa4024f5a6cc7192987ca538c0880298d58e655f70cc4')

prepare() {
  cd "$pkgname-$pkgver"
  sed -e 's|/sbin|/bin|g' -i Makefile
}

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -D -m644 "$srcdir"/chaosvpn.service "$pkgdir"/usr/lib/systemd/system/chaosvpn.service

  patch -d "$pkgdir"/etc/tinc -p0 -i "$srcdir"/iproute2-chaosvpn.patch
  patch -d "$pkgdir"/etc/tinc -p0 -i "$srcdir"/iproute2-warzone.patch
  install -d -m755 "$pkgdir"/etc/tinc/chaos

  sed -e 's|/sbin/ip|/usr/sbin/ip|g' -i "$pkgdir"/etc/tinc/{chaosvpn,warzone}.conf
}
