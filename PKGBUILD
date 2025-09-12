# Maintainer: fuero <fuerob@gmail.com>
pkgname=pg_flame
# renovate: datasource=github-releases depName=mgartner/pg_flame
pkgver=1.2
pkgrel=3
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
  export GOFLAGS="${GOFLAGS} -buildmode=pie -trimpath -modcacherw -mod=readonly -v"
  export GO111MODULE=on
  export GOPROXY=direct

  cd "${pkgname}-${pkgver}"
  go build \
    -ldflags="-s -w ${_x[*]/#/-X=main.}" \
    -o bin/ \
    ./...
}

check() {
  cd "${pkgname}-${pkgver}"
  go test -short ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dpm0755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
