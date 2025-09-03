# Maintainer: Mark Hegreberg <aur@hegreberg.io>

pkgname=moribito
pkgver='0.2.6'
pkgrel=2
pkgdesc='a TUI based LDAP server explorer'
arch=(x86_64 aarch64)
url='https://github.com/ericschmar/moribito'
license=('MIT')
makedepends=(go)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7b07448c6f8f16121232c73f45d8c8c7b59e066f20a00850dde093e724cd98db')
prepare() {
  cd "${pkgname}-${pkgver}"
  mkdir -p bin/
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  
  #taken from make file to set version
  
  go build \
    -ldflags "-linkmode external -X github.com/ericschmar/moribito/internal/version.Version=${pkgver}" \
  	-o bin/moribito \
  	cmd/moribito/main.go
      
}

check() {
  #tests seem to be broken upstream currently
  # https://github.com/ericschmar/moribito/issues/100
  cd "${pkgname}-${pkgver}"
  #go test -v ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  # license isn't in last release
  #install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
