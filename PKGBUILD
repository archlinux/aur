# Maintainer: Sandwich <sandwich dot archworks dot co>
pkgname=mautrix-gmessages
pkgver=0.6.5
pkgrel=0
pkgdesc="A Matrix-gmessages puppeting bridge"
arch=('x86_64' 'aarch64')
license=('AGPL-3.0-or-later')
makedepends=(go git)
depends=('libolm')
url="https://github.com/mautrix/gmessages"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  sysusers-mautrix-gmessages.conf
  mautrix-gmessages.tmpfiles
  mautrix-gmessages.service
)
backup=("etc/${pkgname}/mautrix-gmessages.yaml")
sha256sums=('27604debeb7daf1570281ef8613ca7edbd4677168a11d007f0f2059e2cf60b02'
            '1aa66286775fc52505626b875849dadbb690102bf4e55e5845528552943bb8d4'
            '7774eac143695fa0e69f580c82b8299212ff69d3a0122f7127d1d593bd159ab7'
            'b13396e0ce5509cb2a9c071e93eddcf5f61182251a39884aaaa2917ee76efd3e')

build() {
  cd "$srcdir/gmessages-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  ./build.sh
  ./mautrix-gmessages -e
}

package() {
  cd "$srcdir/gmessages-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$srcdir/sysusers-mautrix-gmessages.conf" "$pkgdir/usr/lib/sysusers.d/mautrix-gmessages.conf"
  install -Dm644 "$srcdir/mautrix-gmessages.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/mautrix-gmessages.conf"

  install -Dm640 "config.yaml" "$pkgdir/etc/$pkgname/mautrix-gmessages.yaml"
  install -Dm644 "$srcdir/mautrix-gmessages.service" "$pkgdir/usr/lib/systemd/system/mautrix-gmessages.service"
  install -Dm644 LICENSE{,.exceptions} -t "$pkgdir/usr/share/licenses/$pkgname"
}
