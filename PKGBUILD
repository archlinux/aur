pkgname=piv-agent
pkgver=0.24.0
pkgrel=1
pkgdesc='An SSH and GPG agent which you can use with your PIV hardware security device (e.g. a Yubikey).'
arch=('x86_64')
url="https://github.com/smlx/${pkgname}"
license=('Apache-2.0')
makedepends=('go')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f7813cf93b83fb7c906659eaa50f953e2d75d083bff386614948c0621b7219b0')

prepare(){
  cd "${pkgname}-${pkgver}"
  mkdir -p build/
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./cmd/...
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
