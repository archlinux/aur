# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=docker-container-healthchecker
pkgver=0.11.2
pkgrel=1
pkgdesc='Runs healthchecks against local docker containers'
arch=('x86_64')
url='https://github.com/dokku/docker-container-healthchecker'
license=('BSD')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3f61a9c1cc2a8ed397a0b8ceab112ec8cd7a62f956b5183482ac8843beb6d254')
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
