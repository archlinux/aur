# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# Contributor: Alkindi42
# -*- sh -*-

pkgname=dasel
pkgver=2.4.1
pkgrel=3
#pkgdesc='Query and update data structures from the command line'
pkgdesc='Select, put and delete data from JSON, TOML, YAML, XML and CSV files with a single tool'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='https://github.com/TomWright/dasel'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz")
options=('lto')

build() {
  cd "$pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'

  go mod tidy

  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode=external -X internal.Version=$pkgver -X main.BuildDate=$(date -u '+%FT%TZ')" \
    -mod=readonly \
    -modcacherw \
    -o "$pkgname" ./cmd/dasel/main.go
}

check() {
  cd "$pkgname-$pkgver"

  go test ./...
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 dasel     "$pkgdir/usr/bin/dasel"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=(
  'eb44263c792ff3b31e5a5086d01b471d07a4282af6716932f12f76bb8cd4eebd'
)
b2sums=(
  '9652bcade198766524b937dbc147f14cc5d5cf801c80c71ec7ae2cefd903b9a242cf8227d91c54de36ef98cf887e2e5b1a4870712f165887f9b705df76f1b41d'
)

# eof
