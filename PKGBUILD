pkgname=piv-agent
pkgver=0.21.2
pkgrel=1
pkgdesc='An SSH and GPG agent which you can use with your PIV hardware security device (e.g. a Yubikey).'
arch=('x86_64')
url="https://github.com/smlx/${pkgname}"
license=('Apache-2.0')
makedepends=('go')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c1714a03984eb382f7108d0f09be78c840023d06ac277df326e89d9185aa0b7b')

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
