# Maintainer: fossdd <fossdd@pwned.life>
pkgname=lyrebird-proxy
pkgver=0.6.1
pkgrel=1
pkgdesc="pluggable transport proxy for Tor, implementing obfs4"
url="https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/lyrebird"
license=('BSD-3-Clause')
arch=('x86_64' 'aarch64' 'armv7h')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.bz2::https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/lyrebird/-/archive/lyrebird-$pkgver/lyrebird-lyrebird-$pkgver.tar.bz2")
sha256sums=('9b88ae705d9e87c0d0fbec1da58192457c60f56386465abc16d6aa05e6f400a1')
b2sums=('63c2635212cc0e579c07976543502c9360a7759b0c6c35c40d69c071ea492f61d3050d9e5896284d4c9c3b4510766de4fb78a985f74cd0422d3f2e2ceb287752')

build() {
  cd "$srcdir/lyrebird-lyrebird-$pkgver"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -v -o lyrebird ./cmd/lyrebird
}

package() {
  cd "$srcdir/lyrebird-lyrebird-$pkgver"

  install -Dm0755 lyrebird "$pkgdir/usr/bin/lyrebird"

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
