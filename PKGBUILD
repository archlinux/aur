# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=gliderlabs-sigil
pkgver=0.11.2
pkgrel=1
pkgdesc='Standalone string interpolator and template processor'
arch=('x86_64')
url='https://github.com/gliderlabs/sigil'
license=('BSD')
# a package with the same name exists and provides a binary with the same name
conflicts=('sigil')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('119dd3bf5db9162b151f134eab699854861be500f34b42b33d8a321db2bc5469')
makedepends=('go')

build() {
  cd "sigil-${pkgver}"

  # Build executable
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-asmflags=-trimpath=/src -gcflags=-trimpath=/src"
  go build -a -ldflags "-s -w -X main.Version=${pkgver}" -o "${pkgname}-build" cmd/sigil.go
}

package() {
  cd "sigil-${pkgver}"

  install -Dm755 "${pkgname}-build" "${pkgdir}/usr/bin/sigil"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/sigil/LICENSE"
}
