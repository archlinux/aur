pkgname=aurview
pkgver=0.5.0
pkgrel=1
pkgdesc="Read-only AUR/package metadata browser TUI"
arch=("x86_64" "aarch64")
url="https://github.com/kristyancarvalho/aurview"
license=("MIT")
makedepends=("go")
options=("!debug")
source=("${pkgname}_${pkgver}_source.tar.gz::https://github.com/kristyancarvalho/aurview/releases/download/v${pkgver}/${pkgname}_${pkgver}_source.tar.gz")
sha256sums=("c651d42fa5e05eaf3b8d3e18c1b81c96535a290c8c80d6634cab26bc6dd89aca")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_ENABLED=0
  local version_pkg="github.com/kristyancarvalho/aurview/internal/version"
  local build_commit="${_commit:-v${pkgver}}"
  local build_date="${_date:-$(date -u +%Y-%m-%dT%H:%M:%SZ)}"
  go build -trimpath -ldflags="-s -w -X ${version_pkg}.Version=${pkgver} -X ${version_pkg}.Commit=${build_commit} -X ${version_pkg}.Date=${build_date}" -o aurview ./cmd/aurview
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 aurview "${pkgdir}/usr/bin/aurview"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
