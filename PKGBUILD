# Maintainer: Bao Trinh <qubidt@gmail.com>
# Contributor: Thiago Almeida <thiago.almeida@topgolf.com>
pkgname=hcledit
url=https://github.com/minamijoyo/hcledit
pkgver=0.2.8
pkgrel=1
pkgdesc="A command line editor for HCL"
arch=('i686' 'x86_64' 'arm' 'aarch64')
license=('MIT')
depends=('glibc')
makedepends=('go')
options=('!lto')
changelog="${pkgname}.changelog"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/minamijoyo/hcledit/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('60d38cbb17126dca34ca9f0ae7a41987dce96819903dd07028e592b91bb10fa646207c3803622b7e15dcfeda14b725aec4460bb0bdd9ba7a825e1cf673e98f8d')

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
