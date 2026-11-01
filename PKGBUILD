# Maintainer: Bryan Childs <godeater[at]gmail[dot]com>

pkgname=cfnrain
pkgver=1.25.4
pkgrel=1
pkgdesc='A development workflow tool for working with AWS CloudFormation'
arch=('x86_64')
url="https://github.com/awesome-foundation/cfnrain"
license=('Apache-2.0')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('2177007e75c8ab40b86e3a48404ff98d1cc3dd8ac2b0e21f0e663040ca481fdab45de8df59145cd3e06756b802dc03f8e8eea4df5b7f94147b4aac4aa8471c95')
b2sums=('8989a8d1ce6ce45f53a466605041d6c74f541ebfcc3f2441b66cf18694b6e12f971769a6f25dc3102c0cb4a4ba5ff006ab2487508e064e1f0b19258125cf116d')

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
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw -buildvcs=false"
  go build -o build ./cmd/...
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
  go test -tags=func_test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
