# Maintainer: Eric Long <i@hack3r.moe>

pkgname=gobgp
pkgver=3.33.0
pkgrel=1
pkgdesc='BGP implemented in the Go Programming Language'
arch=('x86_64' 'aarch64' 'riscv64')
url="https://osrg.github.io/gobgp/"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/osrg/gobgp/archive/refs/tags/v$pkgver.tar.gz"
        "gobgpd.service")
sha256sums=('e5f4115838ceaa765cde8621e7bc386184d58b281aafad844a65cf032fd96f88'
            '2bb2aaca02956482257d7326a2e61d7f945c0d2a4c4bdb3079b2b2421de0a097')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -v -o build ./cmd/...
}

check() {
  cd "$pkgname-$pkgver"
  export GOFLAGS="${GOFLAGS/-trimpath}"
  go test -v ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/gobgp "$pkgdir"/usr/bin/gobgp
  install -Dm755 build/gobgpd "$pkgdir"/usr/bin/gobgpd
  install -Dm644 ../gobgpd.service "$pkgdir"/usr/lib/systemd/system/gobgpd.service
}
