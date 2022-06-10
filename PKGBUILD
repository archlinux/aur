# Maintainer: Stephan Springer <buzo+arch@Lini.de>

pkgname=chaosvpn
pkgver=2.19
pkgrel=2
pkgdesc="Configuration generator for ChaosVPN"
arch=('i686' 'x86_64')
url='https://wiki.hamburg.ccc.de/ChaosVPN'
license=('Apache')
makedepends=('flex')
depends=('tinc' 'iproute2')
backup=('etc/tinc/chaosvpn.conf' 'etc/tinc/warzone.conf')

source=("$pkgname-$pkgver.tar.gz::https://github.com/ryd/chaosvpn/archive/v$pkgver.tar.gz"
        "crypto.c.patch::https://github.com/ryd/chaosvpn/commit/c842faae63b562acc7d989a9cdc815def9ee2ed6.diff"
        iproute2-chaosvpn.patch
        iproute2-warzone.patch
        chaosvpn.service)
sha256sums=('53625d131140529e88d8a14c34cc4d8d5d0134292d90f4ae55e9df29d3232828'
            '8380e23126b12aa38e44d43d34c29da3cc67ba1cb626ce98899af2d8e4d13bcc'
            '4c975e57867aae2291f4dfe2c024f8b98907ec8f83345672ee0641700da433a8'
            'b7baf5d649c7acf09f3afbc91097caaa8fbe762b212fd47adc88d330e9dfa102'
            'bb00812aa6fd254f495aa4024f5a6cc7192987ca538c0880298d58e655f70cc4')

prepare() {
  cd "$pkgname-$pkgver"
  sed -e 's|/sbin|/bin|g' -e 's|-D_BSD_SOURCE|-D_DEFAULT_SOURCE|' -i Makefile
  patch -p1 -i "$srcdir"/crypto.c.patch
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
