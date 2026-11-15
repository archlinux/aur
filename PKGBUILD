# Maintainer: melqtx <melqtx@users.noreply.github.com>
pkgname=tork
pkgver=0.5.1
pkgrel=1
pkgdesc="Terminal torrent search and download client"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/melqtx/tork"
license=('MIT')
depends=('glibc')
makedepends=('go>=1.26.10')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('970402a43cae9d542893de07aa1ef41b3207749cacd6fe7d0cbc8740f6a83978')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags "-linkmode=external -X main.version=${pkgver}" -o tork ./cmd/tork
}

check() {
  cd "${pkgname}-${pkgver}"
  # -short skips the loopback BitTorrent integration tests, which want a
  # network and real time - unfriendly to clean build chroots.
  go test -short ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 tork "${pkgdir}/usr/bin/tork"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
