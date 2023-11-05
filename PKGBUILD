# Maintainer: pikl <me@pikl.uk>
_pkgname=mdns-reflector
pkgname="${_pkgname}-git"
pkgver=v0.0.1.dev.1.r13.g4b4cd3b
pkgrel=1
pkgdesc="A lightweight and performant multicast DNS (mDNS) reflector with a modern design."
arch=('any')
url="https://github.com/vfreex/mdns-reflector"
license=('GPL3')
makedepends=('git' 'cmake')
backup=('etc/mdns-reflector/mdns-reflector.conf')
source=("git+https://github.com/vfreex/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  cmake -H. -B. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=release
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir/" install

  install -d -m 0755 "$pkgdir/etc/mdns-reflector"
  install -d -m 0755 "$pkgdir/etc/mdns-reflector/conf.d"

  cd misc
  install -D -m 0644 mdns-reflector.service "$pkgdir/usr/lib/systemd/system/mdns-reflector.service"
  install -D -m 0644 mdns-reflector@.service "$pkgdir/usr/lib/systemd/system/mdns-reflector@.service"
  install -D -m 0644 mdns-reflector/mdns-reflector.conf "$pkgdir/etc/mdns-reflector/mdns-reflector.conf"
}
