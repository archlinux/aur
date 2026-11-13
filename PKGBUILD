# Maintainer: Bryan Childs <godeater[at]gmail[dot]com>

pkgname=cfnrain
pkgver=1.26.0_beta.3
pkgrel=1
pkgdesc='A development workflow tool for working with AWS CloudFormation'
arch=('x86_64')
url="https://github.com/awesome-foundation/cfnrain"
license=('Apache-2.0')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver//_/-}.tar.gz")
sha512sums=('afae144a9896f296d4f99365ee65352bf69dcef53b463d6872486da39268945f63c3fc1e4339fd9acea7184a3ea7043e314af45a9326f18d3c870aec87243fe4')
b2sums=('b5d5e7d1b823e9b95d53596761f2196915d34cdb2e18fff47385f33ae1f09b9094615acc4eb04507cfb2f72db1606d840071c5454429b21a96994686c1d938f7')

prepare(){
  cd "$pkgname-${pkgver//_/-}"
  mkdir -p build/
}

build() {
  cd "$pkgname-${pkgver//_/-}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw -buildvcs=false"
  go build -o build ./cmd/...
}

check() {
  cd "$pkgname-${pkgver//_/-}"
  go test ./...
  go test -tags=func_test ./...
}

package() {
  cd "$pkgname-${pkgver//_/-}"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 "$srcdir/$pkgname-${pkgver//_/-}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
