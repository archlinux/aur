# Maintainer: FichteFoll <fichtefoll2@googlemail.om>
# Contributor: Icaro Perseo <icaroperseo[at]protonmail[dot]com>

pkgname=dashing
pkgver=0.4.0
pkgrel=2
pkgdesc="A Dash Generator Script for Any HTML"
url="https://github.com/technosophos/dashing"
license=('MIT')
arch=('i686' 'x86_64')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/technosophos/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('81b21acae83c144f10d9eea05a0b89f0dcdfa694c3760c2a25bd4eab72a2a3b9')

prepare() {
  cd "${pkgname}-${pkgver}"
}

build() {
  cd "${pkgname}-${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" -X main.version=${pkgver}" \
    -o dashing dashing.go
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Doesn't work
# check() {
#   cd "${pkgname}-${pkgver}"
#   go test ./...
# }
