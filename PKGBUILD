# Maintainer: amitpadhan525 <amitpadhan525@gmail.com>

pkgname=quickshare-cli
pkgver=0.1.10
pkgrel=1
pkgdesc="Cross-platform Quick Share CLI compatible with Android, Windows 11, and Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/amitpadhan525/quickshare-cli"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bc329dc3a56bb4ee8c1f4b86aa8321353ba5bf0c1e50e3d6d542b6ec918862ac')

prepare() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build
  export GOPATH="${srcdir}/gopath"
  go mod download -modcacherw
}

build() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags="-linkmode=external -X main.version=${pkgver}" -o build/quickshare ./cmd/quickshare
}

check() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 build/quickshare "${pkgdir}/usr/bin/quickshare"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 packaging/quickshare-cli.desktop "${pkgdir}/usr/share/applications/quickshare-cli.desktop"
  install -Dm644 packaging/quickshare-cli.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/quickshare-cli.svg"
}
