# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi [dot] net>

pkgname=snowflake-pt-proxy
pkgver=2.1.0
pkgrel=1
pkgdesc="Snowflake is a pluggable transport that proxies traffic through temporary proxies using WebRTC (proxy part)"
url="https://snowflake.torproject.org"
license=('BSD')
arch=('x86_64' 'aarch64')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/snowflake/-/archive/v$pkgver/snowflake-v$pkgver.tar.gz"
        snowflake-proxy.service)
sha256sums=('e9538c1bed1d3354ea68962e2cc829d9eaf5730667bff0013871163ccf47bb56'
            '562e53cd615f7f26df0e39aef2b5b5626a026a3c9a601c1d47a63ae70f4d7ed1')
b2sums=('14cd360c2154207a88be20d0bb711a926a732340058ffd7653d586ddd78c842d9d3c04dcc369e2cd146ee3089616c409b18efc74c6b2329fc980690368438fa8'
        'fa45242d7f35a8fd79a36533249fde87777c69dd1415eeadc2a11a39f768fa754aa1831191ba31ebf6e2167471ab97c237ceafd8be95d71ed34995e0e2ad64a2')

build() {
  cd "snowflake-v$pkgver"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -v -o proxy/snowflake-proxy ./proxy
}

package() {
  cd "snowflake-v$pkgver"

  install -Dm0755 proxy/snowflake-proxy "$pkgdir/usr/bin/snowflake-proxy"

  install -Dm0644 "$srcdir/snowflake-proxy.service" "$pkgdir/usr/lib/systemd/system/snowflake-proxy.service"

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
