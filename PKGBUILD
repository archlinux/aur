# Maintainer: Xuanwo <xuanwo@archlinuxcn.org>
pkgname=atomdns
pkgver=0.2.0
pkgrel=1
pkgdesc='A DNS server'
makedepends=('go')
arch=('x86_64')
url='https://github.com/Xuanwo/atomdns'
license=('Apache')
provides=('atomdns')
backup=(etc/atomdns/atomdns.hcl)
source=(atomdns-${pkgver}.tar.gz::https://github.com/Xuanwo/${pkgname}/archive/v${pkgver}.tar.gz
        atomdns.service
        atomdns-sysusers.conf
        atomdns-tmpfiles.conf
        atomdns.hcl)
sha256sums=('e5b42b8707aa9a58c21104916d1553c0c8507efbbf95bbb0ccc42e7c69cb6f8b'
            '7fe368b80459a3ea6f1cfaee1c5dc9160bfcf0e37901daa125b91b75f41b126f'
            'd1a087f28a6bb443bb5fda6f549eb236d9688bb1af25b0cdcc29d75f1b44cebb'
            'f757fc1f48c2a96e29b2f883d13e8918bfff4c244d6c970716acef61b1eef66e'
            'c209597e38b8c10a683acc20841a6419c468703062bd9ea4d51f42d6ad568d4f')

build() {
  export GOPATH="$srcdir/build"
  export PATH=$GOPATH/bin:$PATH

  cd $pkgname-${pkgver}
  # In order to build with PIE buildmode, we need to use CGO.
  # Currently, we will keep cgo disabled for better performance.
  GO111MODULE=on CGO_ENABLED=0 go build -v -ldflags="-s -w" -o atomdns ./cmd/atomdns
}

package() {
  # Install binary
  install -Dm755 "$srcdir/$pkgname-${pkgver}/atomdns" "$pkgdir/usr/bin/atomdns"
  # Install systemd service
  install -Dm644 "$srcdir/atomdns.service" "$pkgdir/usr/lib/systemd/system/atomdns.service"
  # Install atomdns sysusers
  install -Dm644 "$srcdir/atomdns-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/atomdns.conf"
  # Install atomdns tmpfiles
  install -Dm644 "$srcdir/atomdns-tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/atomdns.conf"
  # Install default atomdns config
  install -Dm644 atomdns.hcl "$pkgdir/etc/atomdns/atomdns.hcl"
}

# vim: ft=sh syn=sh et

