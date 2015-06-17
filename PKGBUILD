# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contibutor: Steven Allen <steven@stebalien.com>

pkgname=nftables-git
pkgver=0.099.r3.g35f689e
pkgrel=1
pkgdesc='Netfilter nf_tables infrastructure library'
arch=(i686 x86_64)
url='http://netfilter.org/projects/nftables/'
license=(GPL2)
depends=(libmnl gmp libnftnl-git ncurses)
makedepends=(git docbook2x perl-xml-libxml)
conflicts=(nftables)
# systemd support is stolen from https://github.com/devkid/nftables-systemd
source=(git://git.netfilter.org/nftables
        nftables.service
        nftables-ctl)
sha1sums=('SKIP'
          'efbc57f8ea6c37baaa8dac7bab026e9babf5aa97'
          '384642dd1b9490870a92b5d6fca62c3e942be109')

pkgver() {
  cd nftables
  git describe | sed 's/^v//; s/-/.r/; s/-/./'
}

prepare() {
  cd nftables
  sed 's/docbook2x-man/docbook2man/g' -i Makefile.rules.in -i configure.ac
}

build() {
  cd nftables
  ./autogen.sh
  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc
  make
}

package() {
  cd nftables
  make DESTDIR="$pkgdir" install
  install -D -m644 "$srcdir/nftables.service" "$pkgdir/usr/lib/systemd/system/nftables.service"
  install -D -m755 "$srcdir/nftables-ctl" "$pkgdir/usr/bin/nftables-ctl"
}
