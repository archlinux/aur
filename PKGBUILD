# Maintainer: Máté Eckl <ecklm94@gmail.com>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Steven Allen <steven@stebalien.com>

pkgname=nftables-git
epoch=1
pkgver=1.0.0
pkgrel=1
pkgdesc='Netfilter tables userspace tools'
arch=(x86_64)
url='https://netfilter.org/projects/nftables/'
license=('GPL2')
optdepends=('python: Python bindings')
depends=(libmnl libnftnl-git gmp readline ncurses jansson)
makedepends=(asciidoc git bison flex)
optdepends=('python: Python bindings')
backup=('etc/nftables.conf')
provides=(nftables)
conflicts=(nftables)
source=(git://git.netfilter.org/nftables
        nftables.conf
        nftables.service)
install=nftables.install
sha256sums=('SKIP'
            '2aff88019097d21dbfa4713f5b54c184751c86376e458b683f8d90f3abd232a8'
            '3c6a34a400022450df0b6e97b3f16eea5cab7741a0e5f16858b46a3e6591b5af')

pkgver() {
  cd nftables
  git describe | sed 's/^v//; s/-/.r/; s/-/./'
}

build() {
  cd nftables
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/usr/share \
    --with-json
  make
}

package() {
  cd nftables
  make DESTDIR="$pkgdir" install
  # basic safe firewall config
  install -Dm644 "$srcdir/nftables.conf" "$pkgdir/etc/nftables.conf"
  # systemd
  install -Dm644 "$srcdir/nftables.service" "$pkgdir/usr/lib/systemd/system/nftables.service"
}
