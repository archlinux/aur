# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Nicolas Quiénot <niQo @ aur>
# Contributor: Falk Stern <falk@fourecks.de>

pkgname=shairport-git
pkgver=r475.d679d19
pkgrel=1
pkgdesc='Emulates an AirPort Express for the purpose of streaming music from iTunes and compatible iPods and iPhones'
url='http://github.com/abrasive/shairport'
arch=(i686 x86_64)
license=(GPL)
backup=(etc/conf.d/shairport)
depends=(libao openssl libpulse avahi)
makedepends=(git)
source=(git://github.com/abrasive/shairport.git)
sha1sums=('SKIP')

pkgver() {
  cd shairport
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd shairport
  sed 's|/usr/local|/usr|' -i scripts/systemd/shairport.service
}

build() {
  cd shairport
  make
}

package() {
  cd shairport
  make PREFIX="$pkgdir/usr" install
  install -D -m644 scripts/systemd/shairport.service "$pkgdir"/usr/lib/systemd/system/shairport.service
  install -d "$pkgdir"/etc/conf.d/
  echo "# Shairport Daemon options" > "$pkgdir"/etc/conf.d/shairport
}
