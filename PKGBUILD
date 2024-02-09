# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=procfile-util
pkgver=0.17.0
pkgrel=1
pkgdesc='A tool for interacting with Procfiles'
arch=('x86_64')
url='https://github.com/dokku/procfile-util'
license=('MIT')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0d687819a64e19bc623ef0bb27aef0b0f05a495ff88ed9824ca81f3b378cae5c')
makedepends=('go')

build() {
  cd "${pkgname}-${pkgver}"

  # Build executable
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-asmflags=-trimpath=/src -gcflags=-trimpath=/src"
  go build -a -ldflags "-s -w -X main.Version=${pkgver}" -o "${pkgname}-build" .
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "${pkgname}-build" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
