# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
pkgname=carryout
pkgver=0.2.0
pkgrel=1
pkgdesc="Resumable, verifying downloader for multi-part Google Takeout exports"
arch=('x86_64' 'aarch64')
url="https://github.com/jm2/carryout"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('65372e94bf36ed2de49e9dba3cc75341db8bfec567fd6d97d411bced684039f9')

# Arch Go package guidelines: the repository's go, never a downloaded
# toolchain (go.mod asks for go1.24), modules fetched in prepare() (there are
# none: carryout is standard library only), and a PIE build linked
# externally so makepkg's CFLAGS/LDFLAGS (RELRO, etc.) apply.
_goenv() {
  export GOTOOLCHAIN=local
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
}

prepare() {
  cd "${pkgname}-${pkgver}"
  _goenv
  go mod download
}

build() {
  cd "${pkgname}-${pkgver}"
  _goenv
  # Upstream's release stamps the bare version ("carryout 0.2.0"), no "v".
  go build -ldflags "-linkmode=external -X main.version=${pkgver}" -o build/carryout .
}

check() {
  cd "${pkgname}-${pkgver}"
  _goenv
  go test ./...
  ./build/carryout version | grep -Fx "carryout ${pkgver}"
}

package() {
  cd "${pkgname}-${pkgver}"
  # What upstream's release archives hold: the binary, README and LICENSE.
  install -Dm755 build/carryout "${pkgdir}/usr/bin/carryout"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
