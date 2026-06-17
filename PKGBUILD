pkgname=aurview
pkgver=0.4.2
pkgrel=1
_commit=dcde7d2
_date=2026-06-17T05:25:21Z
pkgdesc="Read-only AUR/package metadata browser TUI"
arch=("x86_64" "aarch64")
url="https://github.com/kristyancarvalho/aurview"
license=("MIT")
makedepends=("go")
options=("!debug")
source=("${pkgname}_${pkgver}_source.tar.gz::https://github.com/kristyancarvalho/aurview/releases/download/v${pkgver}/${pkgname}_${pkgver}_source.tar.gz")
sha256sums=("b9e5427ee7f63e0557506f676e26d75be8338255f14bdd453aa7486b5df55147")

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
