# Maintainer: Boohbah <boohbah at gmail.com>
# Contributor: Zach Latta <zach@zachlatta.com>
# Contributor: bananaoomarang <milomord@gmail.com>

pkgname=fleet-git
pkgver=0.3.2.r1003.g1c8dc88
pkgrel=1
pkgdesc='A distributed init system (git version)'
arch=('i686' 'x86_64')
url='https://github.com/coreos/fleet'
license=('Apache')
makedepends=('git' 'go')
provides=('fleet')
conflicts=('fleet')
backup=('etc/fleet/fleet.conf')
source=("$pkgname::git+$url"
        'fleet.service')
md5sums=('SKIP'
         '09b751feeec2c7ae4544bbc212466e37')

pkgver() {
  cd "$pkgname"
  git describe --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  sed -i 's/install -a/install/' build
}

build() {
  cd "$pkgname"
  ./build
}

check() {
  cd "$pkgname"
  ./test
}

package() {
  cd "$pkgname"
  install -Dm644 fleet.conf.sample "$pkgdir/etc/fleet/fleet.conf"
  install -Dm755 bin/fleetd "$pkgdir/usr/bin/fleetd"
  install -Dm755 bin/fleetctl "$pkgdir/usr/bin/fleetctl"

  # Install unit file from coreos
  install -Dm644 "$srcdir/fleet.service" "$pkgdir/usr/lib/systemd/system/fleet.service"
}

# vim:set sts=2 sw=2 et:
