# Maintainer: Funami
pkgname=coredns-fanout
pkgver=1.8.6
pkgrel=1
pkgdesc="A DNS server that chains plugins - with module fanout"
arch=('x86_64' 'i686')
url="https://github.com/networkservicemesh/fanout"
license=('APACHE')
provides=('coredns')
conflicts=('coredns')
makedepends=('go')
source=("coredns-$pkgver.tar.gz::https://github.com/coredns/coredns/archive/v$pkgver.tar.gz"
        'coredns.service'
        'coredns-sysusers.conf')
sha256sums=('cbe3764afe2148b8047ea7e5cbba5108c298dee3a9a0391028e2980e35beaa2b'
            '030cd8e938c293c11a9acdb09b138f98b37874772072336792ec4bf0d9eff9b1'
            '536d03f8b20b0d2d6e8f96edd7e4e4dd7f6fef39ab0e952522d8725f3cc186b7')

build() {
  export GOPATH="$srcdir/build"
  cd "coredns-$pkgver"
  echo 'fanout:github.com/networkservicemesh/fanout' >> plugin.cfg
  make
}

package() {
  install -Dm755 "coredns-$pkgver/coredns" "$pkgdir/usr/bin/coredns"
  install -Dm644 "coredns.service" "$pkgdir/usr/lib/systemd/system/coredns.service"
  install -Dm644 "coredns-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/coredns.conf"
  
  install -Dm644 "coredns-$pkgver/man"/*.1 -t "$pkgdir/usr/share/man/man1"
  install -Dm644 "coredns-$pkgver/man"/*.5 -t "$pkgdir/usr/share/man/man5"
  install -Dm644 "coredns-$pkgver/man"/*.7 -t "$pkgdir/usr/share/man/man7"
  
  install -d "$pkgdir/etc/coredns"
}
