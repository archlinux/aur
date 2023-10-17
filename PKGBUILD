# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi [dot] net>

pkgname=snowflake-pt-proxy
pkgver=2.7.0
pkgrel=1
pkgdesc="Snowflake is a pluggable transport that proxies traffic through temporary proxies using WebRTC (proxy part)"
url="https://snowflake.torproject.org"
license=('BSD')
arch=('x86_64' 'aarch64' 'armv7h')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/snowflake/-/archive/v$pkgver/snowflake-v$pkgver.tar.gz"
        snowflake-proxy.service)
sha256sums=('69d0408905a29919940e9a3994b480dd3414f0dc177aac24e9afe9ff56495029'
            '81ed80bea97fb9874734d4ec7ccb9a850e6aa5b186a354990066344446bd1412')
b2sums=('43ad178143af9f9f5b9c167c7a1b59adbcf77370fb59690b20d5e05731330ccf69acdd221810ff99f72754418826ad2ec07dfdfec40d9607fd0ae52b92d1a3b2'
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
