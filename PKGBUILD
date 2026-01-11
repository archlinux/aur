pkgname=mautrix-bluesky
pkgver=0.2510.0
pkgrel=2
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
            'c6c6a264d0fd1f45da48b7b45e07fde661f5b925decd68968f43b45df41d9ea8'
            '7af0b7d9a60e7c83ba98d324da6b13d22382fddc455a5d5400d5d0c1a3fbe480'
            '79c47de98d7dd9a344f5a58f895083695fc8b52c7858fec113ea2fcad115547e')

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
