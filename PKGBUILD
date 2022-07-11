# Maintainer: a821 mail de
# Contributor: Máté Eckl <ecklm94@gmail.com>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Steven Allen <steven@stebalien.com>

pkgname=nftables-git
epoch=1
pkgver=1.0.4.r39.g46980cdd
pkgrel=1
pkgdesc='Netfilter tables userspace tools'
arch=('x86_64')
url='https://netfilter.org/projects/nftables/'
license=('GPL2')
depends=('libmnl' 'libnftnl' 'gmp' 'readline' 'ncurses' 'jansson')
optdepends=('python: Python bindings')
makedepends=('asciidoc' 'git' 'python')
backup=('etc/nftables.conf')
provides=(nftables)
conflicts=(nftables)
source=(git://git.netfilter.org/nftables
        nftables.conf
        nftables.service)
install=nftables.install
sha256sums=('SKIP'
            '2aff88019097d21dbfa4713f5b54c184751c86376e458b683f8d90f3abd232a8'
            'deffeef36fe658867dd9203ec13dec85047a6d224ea63334dcf60db97e1809ea')

pkgver() {
  cd nftables
  git describe | sed 's/^v//; s/-/.r/; s/-/./'
}

build() {
  cd nftables
  sh autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/usr/share \
    --with-json \
    --with-cli=readline
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

# vim: set ts=2 sw=2 et:
