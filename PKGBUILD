# Maintainer: fossdd <fossdd@pwned.life>
pkgname=lyrebird-proxy
pkgver=0.5.0
pkgrel=2
pkgdesc="pluggable transport proxy for Tor, implementing obfs4"
url="https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/lyrebird"
license=('BSD-3-Clause')
arch=('x86_64' 'aarch64' 'armv7h')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.bz2::https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/lyrebird/-/archive/lyrebird-$pkgver/lyrebird-lyrebird-$pkgver.tar.bz2")
sha256sums=('63dd7c538227b4f66bd1192dd2131b1bc30d1904f5f8d5c43b0d675a381e8133')
b2sums=('d534074f6db7ad190b12010ddc44889c15ae2c3dc594e30dea41ae1f092ca83481ecb51611d763b63a8b3d8d97f887fdc4e216b41dab3b219d7c2df2f7b5d84f')

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
