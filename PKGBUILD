# Maintainer: Nomadcxx <noovie@gmail.com>
pkgname=syscgo
pkgver=1.0.7
pkgrel=1
pkgdesc="Terminal animation library and CLI tool for Go"
arch=('x86_64' 'aarch64')
url="https://github.com/Nomadcxx/sysc-Go"
license=('MIT' 'CC-BY-NC-4.0')
depends=()
makedepends=('go>=1.24.2')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Nomadcxx/sysc-Go/archive/v${pkgver}.tar.gz")
sha256sums=('f4b0839686c6c9b323a124d3d260c2c896def2b8185fc33bc8de325ad3d04d5a')

build() {
  cd "${srcdir}/sysc-Go-${pkgver}"
  export CGO_ENABLED=0
  export GOTOOLCHAIN=local
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

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
  if [ -d "assets/fonts" ]; then
    cp -r assets/fonts/*.bit "${pkgdir}/usr/share/syscgo/fonts/"
  fi

  # Install assets
  install -dm755 "${pkgdir}/usr/share/syscgo/assets"
  if [ -d "assets" ]; then
    find assets -maxdepth 1 -type f -name "*.txt" -exec cp {} "${pkgdir}/usr/share/syscgo/assets/" \;
  fi

  install -Dm644 animations/models/RAMA_SYSC.txt "${pkgdir}/usr/share/syscgo/assets/RAMA_SYSC.txt"

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 animations/models/README.md "${pkgdir}/usr/share/licenses/${pkgname}/AK47-ATTRIBUTION.md"

  # Install documentation
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 GUIDE.md "${pkgdir}/usr/share/doc/${pkgname}/GUIDE.md"
}
