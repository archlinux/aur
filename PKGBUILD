# Maintainer: Fethbita <aur AT fethbita DOT com>

pkgname=verifpal
pkgver=0.27.0
pkgrel=2
pkgdesc="Cryptographic protocol analysis for real-world protocols."
arch=('x86_64')
url="https://verifpal.com"
license=('GPL3')
makedepends=('go')
source=("https://source.symbolic.software/verifpal/verifpal/-/archive/v${pkgver}/verifpal-v${pkgver}.tar.bz2")
sha256sums=('a1a024e271c9364f3076278c2fc3fd0da93b9d5cd75468691d86787fbd61e8c0')

prepare(){
  cd "$pkgname-v$pkgver"
  mkdir -p build/linux
}

build() {
  cd "$pkgname-v$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build/linux ./cmd/...
}

check() {
  cd "$pkgname-v$pkgver"
  go clean -testcache
  go test ./...
}

package() {
  cd "$pkgname-v$pkgver"
  install -Dm755 "build/linux/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/examples"
  cp -r examples/* "${pkgdir}/usr/share/doc/${pkgname}/examples/"
}

# vim:set ts=2 sw=2 et:
