# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi [dot] net>

pkgname=snowflake-pt-proxy
pkgver=2.15.3
pkgrel=1
pkgdesc="Snowflake is a pluggable transport that proxies traffic through temporary proxies using WebRTC (proxy part)"
url="https://snowflake.torproject.org"
license=('BSD-3-Clause')
arch=('x86_64' 'aarch64' 'armv7h')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/snowflake/-/archive/v$pkgver/snowflake-v$pkgver.tar.gz"
        snowflake-proxy.service)
sha256sums=('a78196e776297ef127122a84d0be691ec978d8263bc97f773e553be042632e57'
            '81ed80bea97fb9874734d4ec7ccb9a850e6aa5b186a354990066344446bd1412')
b2sums=('3b9cd648a23751fcad771754ed1c62e0997b8e89997c0b30fa02c4cf3c0fa124773cf0e9fd5f81f8d4eeb0f20ff55d1d7c142a8a35401909777f1c4ad07e214e'
        '2ba698a76a06b8ebee3cd8c44562783aa3939f66528d1573ac93a59dcc6a8de61f160b5dbc0e8b83c2473bedf037d69fbee9b33befa24027693e556fd5d3d575')

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
