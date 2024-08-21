# Maintainer: tuhtah <tamer.fahmy at gmail dot com>
# Adapted from benthos: https://aur.archlinux.org/packages/benthos

pkgname=bento
pkgdesc='Fancy stream processing made operationally mundane.'
arch=(aarch64 armv7h x86_64)
url='https://warpstreamlabs.github.io/bento/'
_url='https://github.com/warpstreamlabs/bento'
_branch='main'
pkgver=1.2.0
pkgrel=0
license=('MIT')
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::${_url}/archive/v${pkgver}.tar.gz")
sha256sums=('9980b425b486860a164399f078ea123e6c0798b3b2ccea00514011b31225e7ab')
provides=($pkgname)
conflicts=($pkgname)

build() {
  cd "${pkgname}-${pkgver}"

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  # Upgrading parquet-go dependency from v0.20.0 -> v0.23.0 fixes linker error with Go 1.23:
  # link: github.com/parquet-go/parquet-go/hashprobe/aeshash: invalid reference to runtime.aeskeysched
  # Reported upstream: https://github.com/warpstreamlabs/bento/pull/105
  # FIXME: remove next line once fixed in next release
  go get -u github.com/parquet-go/parquet-go@v0.23.0 && go mod tidy

  go build -o bento cmd/bento/main.go
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
