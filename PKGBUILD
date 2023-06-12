# Maintainer: Bao Trinh <qubidt@gmail.com>
# Contributor: Thiago Almeida <thiago.almeida@topgolf.com>
pkgname=hcledit
url=https://github.com/minamijoyo/hcledit
pkgver=0.2.9
pkgrel=1
pkgdesc="A command line editor for HCL"
arch=('i686' 'x86_64' 'arm' 'aarch64')
license=('MIT')
depends=('glibc')
makedepends=('go')
options=('!lto')
changelog="${pkgname}.changelog"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/minamijoyo/hcledit/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('bd399eb196bb75eefa0f15511aa6b7b60742376c058f2316bf06fb041e6627f081653c4f5a90cb1d4573aa950283114c89bf199b99e801568804d6e328cfa68e')

prepare() {
  cd "${pkgname}-${pkgver}"

  # create directory for build output
  mkdir -p build

  # download dependencies
  go mod download
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o build .
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
