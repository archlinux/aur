# Maintainer: Daniel Micay <danielmicay@gmail.com>
_pkgname=paxd
pkgname=paxd-git
pkgver=10.r4.g2e45708
pkgrel=1
pkgdesc='PaX exception daemon'
arch=(i686 x86_64)
url='https://github.com/thestinger/paxd/'
license=(MIT)
depends=(glibc)
makedepends=(git)
source=(git://github.com/thestinger/paxd 10-enable-pax.conf)
md5sums=('SKIP'
         'a40677d2cd39ada4c2560927c67e0ea2')
backup=(etc/paxd.conf)
provides=(paxd)
conflicts=(paxd)

pkgver() {
  cd $_pkgname
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  make CC=gcc
}

package() {
  cd $_pkgname
  mkdir -p "$pkgdir/usr/lib/systemd/system/sysinit.target.wants"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 ../10-enable-pax.conf "$pkgdir/etc/sysctl.d/10-enable-pax.conf"
}
