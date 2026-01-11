pkgname=mautrix-bluesky
pkgver=0.2510.0
pkgrel=1
pkgdesc="mautrix-bluesky puppeting bridge"
arch=('x86_64' 'aarch64')
license=('AGPL-3.0-or-later')
makedepends=('go')
depends=('libolm')
url="https://github.com/mautrix/bluesky"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  mautrix-bluesky.sysusers
  mautrix-bluesky.tmpfiles
  mautrix-bluesky.service
)
backup=("etc/${pkgname}/mautrix-bluesky.yaml")
sha256sums=('3eab28dbab8c52751affcba1f86ff854bbe9a4e4eaa86daa6e91aa6edeea3d33'
            '409e8fb3e35de1bd1ceebefa0ac275ad62ec66680117648058bcc177ddd2f9a1'
            '2e5ecb77aa175c1ebce40a5ff560bb5ee26ed39b3d1f4cf6d62db2ad604050b4'
            '0f909a1b9170a72efc8cca5f51334b73d0e04e5346ae23b75169eaccca7574a2')

build() {
  cd "$srcdir/bluesky-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  ./build.sh
  ./mautrix-bluesky -e
}

package() {
  cd "$srcdir/bluesky-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$srcdir/mautrix-bluesky.sysusers" "$pkgdir/usr/lib/sysusers.d/mautrix-bluesky.conf"
  install -Dm644 "$srcdir/mautrix-bluesky.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/mautrix-bluesky.conf"

  install -Dm640 "config.yaml" "$pkgdir/etc/$pkgname/mautrix-bluesky.yaml"
  install -Dm644 "$srcdir/mautrix-bluesky.service" "$pkgdir/usr/lib/systemd/system/mautrix-bluesky.service"
  install -Dm644 LICENSE{,.exceptions} -t "$pkgdir/usr/share/licenses/$pkgname"
}
