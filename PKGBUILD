# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=docker-container-healthchecker
pkgver=0.8.0
pkgrel=1
pkgdesc='Runs healthchecks against local docker containers'
arch=('x86_64')
url='https://github.com/dokku/docker-container-healthchecker'
license=('BSD')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1a06f53c02f62fa1adb3471ad4afd113bb6be10c47b19a4a9e0c3229e7cce243')
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

  install -Dm755 docker-container-healthchecker-build "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
