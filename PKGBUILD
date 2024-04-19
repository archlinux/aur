# Maintainer: Bao Trinh <qubidt@gmail.com>
# Contributor: Thiago Almeida <thiago.almeida@topgolf.com>
pkgname=hcledit
url=https://github.com/minamijoyo/hcledit
pkgver=0.2.11
pkgrel=1
pkgdesc="A command line editor for HCL"
arch=('i686' 'x86_64' 'arm' 'aarch64')
license=('MIT')
depends=('glibc')
makedepends=('go')
options=('!lto')
changelog="${pkgname}.changelog"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/minamijoyo/hcledit/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('eb8a363060d9b9408f0eaa57e8f5c76fa7a7f445764a95453229c669e58cf44a35997c0e5f94b75da3d7cd7ea0ff66c62a67ed9ae8eba6e7eb203d1458e73b1a')

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
