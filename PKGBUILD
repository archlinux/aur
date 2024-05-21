# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=gliderlabs-sigil
pkgver=0.11.0
pkgrel=1
pkgdesc='Standalone string interpolator and template processor'
arch=('x86_64')
url='https://github.com/gliderlabs/sigil'
license=('BSD')
# a package with the same name exists and provides a binary with the same name
conflicts=('sigil')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d626d585f938a0c27a6fe80e0d189b919b47b02a3c45d1b1d125082a9c7d6eb6')
makedepends=('go')

build() {
  cd "sigil-${pkgver}"

  # Build executable
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-asmflags=-trimpath=/src -gcflags=-trimpath=/src"
  go build -a -ldflags "-s -w -X main.Version=${pkgver}" -o "${pkgname}-build" .
}

package() {
  cd "sigil-${pkgver}"

  install -Dm755 "${pkgname}-build" "${pkgdir}/usr/bin/sigil"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/sigil/LICENSE"
}
