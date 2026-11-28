# Maintainer: amitpadhan525 <amitpadhan525@gmail.com>

pkgname=quickshare-cli
pkgver=0.1.3
pkgrel=1
pkgdesc="Cross-platform Quick Share CLI compatible with Android, Windows 11, and Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/amitpadhan525/quickshare-cli"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e31a8e3dfd09be70b5cef58ff8af71db5512bc922b6097424bfe49f45001ae04')

prepare() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -ldflags="-X main.version=${pkgver}" -o build/quickshare ./cmd/quickshare
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 build/quickshare "${pkgdir}/usr/bin/quickshare"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
