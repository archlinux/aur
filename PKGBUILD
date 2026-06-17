# Maintainer: Jerome Kerdreux <Jerome.Kerdreux@Finix.eu.org>
pkgname=owns
pkgver=0.11.1
pkgrel=1
pkgdesc="Personal DNS server with per-domain forwarding, caching, hosts file, and DoT support"
arch=('x86_64' 'aarch64')
url="https://github.com/jkerdreux-imt/owns"
license=('BSD')
makedepends=('go')
depends=('glibc')
backup=('etc/owns/forward.yaml' 'etc/owns/hosts.txt')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "owns.service")
sha256sums=('7e54b6964ffdf79b7b569e55448ab2ddc9282dd809ad8cf1f4cd97c2ae6ed327'
            'a9956eeed023f17d743d1122803bb12800151bfb8afaa5a0b365505fea532569')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  CGO_ENABLED=0 go build \
    -ldflags "-s -w" \
    -o owns .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Binary
  install -Dm755 owns "$pkgdir/usr/bin/owns"

  # Config directory and example files
  install -dm755 "$pkgdir/etc/owns"
  install -m644 conf/forward.yaml "$pkgdir/etc/owns/forward.yaml"
  install -m644 conf/hosts.txt    "$pkgdir/etc/owns/hosts.txt"

  # Systemd service
  install -Dm644 "$srcdir/owns.service" "$pkgdir/usr/lib/systemd/system/owns.service"

  # License
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
