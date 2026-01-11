pkgname=mautrix-twitter
pkgver=0.2511.0
pkgrel=1
pkgdesc="mautrix-twitter puppeting bridge"
arch=('x86_64' 'aarch64')
license=('AGPL-3.0-or-later')
makedepends=('go')
depends=('libolm')
url="https://github.com/mautrix/twitter"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  mautrix-twitter.sysusers
  mautrix-twitter.tmpfiles
  mautrix-twitter.service
)
backup=("etc/${pkgname}/mautrix-twitter.yaml")
sha256sums=('89b34b2fbed2a3b43ab97b0aa275046c912daa38dc19a058a1456a14c99e2e52'
            'e3afd1ce8825cf6dc958bfdd566998304fa690af70b85851e0158ea656fcfd35'
            'ec0be2a5bbfeb35912cb4972506d33cc47511537ed1dfd074472104fe91dc5a6'
            '87ca71cd6bef563fa1949c9ef8306faa2cfb88957cc7c5aeef72e9b2fd1903e0')

build() {
  cd "$srcdir/twitter-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  ./build.sh
  ./mautrix-twitter -e
}

package() {
  cd "$srcdir/twitter-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$srcdir/mautrix-twitter.sysusers" "$pkgdir/usr/lib/sysusers.d/mautrix-twitter.conf"
  install -Dm644 "$srcdir/mautrix-twitter.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/mautrix-twitter.conf"

  install -Dm640 "config.yaml" "$pkgdir/etc/$pkgname/mautrix-twitter.yaml"
  install -Dm644 "$srcdir/mautrix-twitter.service" "$pkgdir/usr/lib/systemd/system/mautrix-twitter.service"
  install -Dm644 LICENSE{,.exceptions} -t "$pkgdir/usr/share/licenses/$pkgname"
}
