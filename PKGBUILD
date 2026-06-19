# Maintainer: ML <contact@mlgpt.io>
pkgname=late-cli
pkgver=1.3.0
pkgrel=1
pkgdesc="High performance coding agent that just works with local or cloud models. Minimal token usage, extreme performance."
arch=('x86_64')
url="https://github.com/mlhher/late-cli"
license=('custom:BUSL-1.1')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d3db681350d547dfcfb187b8dd666a08bbe1c56ca0ecee52c7dbb38e682aba62')

build() {
  cd "${pkgname}-${pkgver}"
  
  # Arch Linux standard Go build flags for security and reproducibility
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  
  # Compile with Arch's external linker AND your Makefile's version injection
  go build -ldflags "-linkmode=external -X late/internal/common.Version=${pkgver}" -o late ./cmd/late
}

check() {
  cd "${pkgname}-${pkgver}"
  go test -v ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  
  # Install the binary as 'late'
  install -Dm755 late "${pkgdir}/usr/bin/late"
  
  # Install the custom Business Source License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
