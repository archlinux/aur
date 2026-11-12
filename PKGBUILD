# Maintainer: Bryan Childs <godeater[at]gmail[dot]com>

pkgname=cfnrain
pkgver=1.26.0_beta.2
pkgrel=1
pkgdesc='A development workflow tool for working with AWS CloudFormation'
arch=('x86_64')
url="https://github.com/awesome-foundation/cfnrain"
license=('Apache-2.0')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver//_/-}.tar.gz")
sha512sums=('3bbc924420c02cf22dae1d7be33a6846f79552f0e87c22b4fd75323d2c12d482a771e964338e7006330bf9e535bd8ac8f554dd2365065e064b07f12290008897')
b2sums=('348c6ce7decd13d1cb2baf0332a778a96307864798d4458dc8ce2a8b3130061942c2dc08e93e56400d381812286413a0588ff943b6406c82eea1f096d4856c9a')

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
