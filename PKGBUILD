# Maintainer: Fuero <fuerob@gmail.com>
pkgname=pg_flame
pkgver=1.2
pkgrel=1
pkgdesc="A flamegraph generator for Postgres EXPLAIN ANALYZE output."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/mgartner/pg_flame"
license=('APACHE')
depends=(
  'glibc'
)
makedepends=(
  'go'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('913c25aa960b5542f94064ee15b77494e7d39adcddacdde31886f1891bb1a30a')

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1
  export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw -x -v"

  cd "$srcdir/$pkgname-$pkgver"
  go build -o ${pkgname} -ldflags "-linkmode=external -extldflags=${LDFLAGS}" .
  strip "${pkgname}"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dpm0755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
