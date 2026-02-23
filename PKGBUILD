# Maintainer: the SpyCheck team <mail at spycheck dot org>
pkgname=spycheck
pkgver=0.1.0
pkgrel=2
pkgdesc='SpyCheck aims to detect spyware and stalkerware using passive network traffic analysis.'
arch=('x86_64')
url="https://spycheck.org"
license=('BSD-3-Clause')
depends=('libpcap' 'networkmanager')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/spycheck/spycheck/archive/v${pkgver}.tar.gz")
sha256sums=('1dc9902b4872693550ee57858db4f4302d0c6941e0d19ff432883bc4fb91fbe0')

prepare(){
  cd "$pkgname"
  mkdir -p build/
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build -ldflags "-X main.version=$(git rev-parse --short HEAD)" ./cmd/...
}

check() {
  cd "$pkgname"
  go test ./...
}

package() {
  cd "$pkgname"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  setcap cap_net_raw+ep "$pkgdir"/usr/bin/$pkgname
}
