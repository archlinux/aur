# Maintainer: Nomadcxx <noovie@gmail.com>
pkgname=syscgo
pkgver=1.0.2
pkgrel=1
pkgdesc="Terminal animation library and CLI tool for Go"
arch=('x86_64' 'aarch64')
url="https://github.com/Nomadcxx/sysc-Go"
license=('MIT')
depends=()
makedepends=('go>=1.21')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Nomadcxx/sysc-Go/archive/v${pkgver}.tar.gz")
sha256sums=('664c308fcc910ab7f573ef577e00f2ebd2cae92ae5da80a33bdd20481d9f2af4')

build() {
  cd "${srcdir}/sysc-Go-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o syscgo ./cmd/syscgo/
  go build -o syscgo-tui ./cmd/syscgo-tui/
}

package() {
  cd "${srcdir}/sysc-Go-${pkgver}"

  # Install binaries
  install -Dm755 syscgo "${pkgdir}/usr/bin/syscgo"
  install -Dm755 syscgo-tui "${pkgdir}/usr/bin/syscgo-tui"

  # Install fonts for TUI
  install -dm755 "${pkgdir}/usr/share/syscgo/fonts"
  cp -r fonts/*.bit "${pkgdir}/usr/share/syscgo/fonts/"

  # Install assets
  install -dm755 "${pkgdir}/usr/share/syscgo/assets"
  cp -r assets/*.txt "${pkgdir}/usr/share/syscgo/assets/" 2>/dev/null || true

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install documentation
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 GUIDE.md "${pkgdir}/usr/share/doc/${pkgname}/GUIDE.md"
}
