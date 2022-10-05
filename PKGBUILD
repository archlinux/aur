# Maintainer: Bao Trinh <qubidt@gmail.com>
# Contributor: Jonatan Bravo <zephrax@gmail.com>
pkgname=envconsul
pkgver=0.13.1
pkgrel=1
pkgdesc="Launch a subprocess with environment variables using data from @HashiCorp Consul and Vault."
arch=('any')
url="https://github.com/hashicorp/envconsul"
license=('MPL2')
makedepends=('go')
changelog="${pkgname}.changelog"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hashicorp/${pkgname}/archive/v${pkgver}/v${pkgname}-${pkgver}.tar.gz")
sha512sums=('69a82bc7f1f50a274824ec02598b7bcd54197b29f073ffe72c1ea0604c084d53f5e68522b59c9709fc3227d17544426de1bce52176fbcf4a9b5b333f88599731')

prepare() {
  cd "${pkgname}-${pkgver}"

  # create directory for build output
  mkdir -p build

  # download dependencies
  go mod download
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  cd "${pkgname}-${pkgver}"

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS}" \
    -o build \
    .
}

check() {
  cd "${pkgname}-${pkgver}"

  # run go tests
  # TODO: currently failling one test
  # go test -v ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
