# Maintainer: brokenpip3 <brokenpip3[at]gmail[dot]com>
# https://github.com/brokenpip3/my-pkgbuilds

pkgname=okta-aws-cli
pkgver=1.1.0
pkgrel=1
pkgdesc="A CLI for having Okta as the IdP for AWS CLI operations"
arch=('any')
url="https://github.com/okta/okta-aws-cli"
license=('APACHE')
makedepends=('go' 'make' 'gofumpt')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('464e3db0fdb8aa5e2d1ef7bf7daff0fc65e2c3b9084f5f76a4ceaab7f9242ae5')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make fmtcheck
  go build -o ./okta-aws-cli cmd/okta-aws-cli/main.go
}

check() {
  cd "$pkgname-$pkgver"
  export GOFLAGS="-trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make test
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 okta-aws-cli "${pkgdir}/usr/bin/okta-aws-cli"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
