# Maintainer: melqtx <melqtx@users.noreply.github.com>
pkgname=tork
pkgver=0.1.3
pkgrel=1
pkgdesc="Terminal torrent search and download client"
arch=('x86_64' 'aarch64')
url="https://github.com/melqtx/tork"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('21a3517fba2f3a6e98f845e4f7b82faa97cf8b60c0c60161b34ab50601d9508f')

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
