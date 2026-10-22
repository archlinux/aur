# Maintainer: Julien Virey <julien.virey@gmail.com>
# Contributor: Yuki Okushi <huyuumi.dev@gmail.com>
pkgname=pinact
pkgver=5.0.1
pkgrel=1
pkgdesc="CLI to pin GitHub Actions and Reusable Workflows to full hashes"
arch=('x86_64' 'aarch64')
url="https://github.com/suzuki-shunsuke/pinact"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('37253e5545c5e27b04389df10bcc9b863dbe236117788e9841e416296b41036d')

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOMODCACHE="${GOMODCACHE:-$srcdir/gomod}"
  go mod download -modcacherw
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags="-linkmode=external -X main.version=${pkgver}" -o ${pkgname} ./cmd/pinact

  # Clean up deps
  go clean -modcache
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
