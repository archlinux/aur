# Maintainer: amitpadhan525 <amitpadhan525@gmail.com>

pkgname=quickshare-cli
pkgver=0.2.0.beta.2
_tagver=0.2.0-beta.2
pkgrel=1
pkgdesc="Cross-platform Quick Share CLI compatible with Android, Windows 11, and Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/amitpadhan525/quickshare-cli"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
provides=('quickshare')
conflicts=('quickshare')
source=("${pkgname}-${_tagver}.tar.gz::${url}/archive/refs/tags/v${_tagver}.tar.gz")
sha256sums=('b11eca23386391af051d4ef8a3986e87e2442ad1e170074a3f889c20362d23d5')

prepare() {
  cd "${pkgname}-${_tagver}"
  mkdir -p build
  export GOPATH="${srcdir}/gopath"
  go mod download -modcacherw
}

build() {
  cd "${pkgname}-${_tagver}"
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags="-linkmode=external -X main.version=${_tagver}" -o build/quickshare ./cmd/quickshare
}

check() {
  cd "${pkgname}-${_tagver}"
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go test ./...
}

package() {
  cd "${pkgname}-${_tagver}"
  install -Dm755 build/quickshare "${pkgdir}/usr/bin/quickshare"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 packaging/quickshare-cli.desktop "${pkgdir}/usr/share/applications/quickshare-cli.desktop"
  install -Dm644 packaging/quickshare-cli.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/quickshare-cli.svg"
}
