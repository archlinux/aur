# Maintainer: Ivan Kuznetsov <ivankuznetsov@users.noreply.github.com>

pkgname=screenote-cli
pkgver=0.4.0
pkgrel=1
pkgdesc='Command-line client for Screenote visual feedback workflows'
arch=('x86_64' 'aarch64')
url='https://github.com/ivankuznetsov/screenote-cli'
license=('MIT')
depends=('glibc')
makedepends=('go')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f3818d65f6c224f8e9775525f8f6bf692f675141de3a7ffc990b7b0092f9da51')

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="$srcdir/gopath"
  go mod download
}

build() {
  cd "${pkgname}-${pkgver}"
  local build_date
  build_date="$(date -u -d "@${SOURCE_DATE_EPOCH}" +%Y-%m-%dT%H:%M:%SZ)"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="$srcdir/gopath"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  go build \
    -ldflags="-linkmode=external -X github.com/ivankuznetsov/screenote-cli/internal/cli.Version=${pkgver} -X github.com/ivankuznetsov/screenote-cli/internal/cli.Commit=v${pkgver} -X github.com/ivankuznetsov/screenote-cli/internal/cli.BuildDate=${build_date}" \
    -o screenote ./cmd/screenote
}

check() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="$srcdir/gopath"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 screenote "$pkgdir/usr/bin/screenote"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
