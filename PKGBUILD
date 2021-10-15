# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=waypoint
pkgver=0.6.0
pkgrel=1
pkgdesc="A tool to build, deploy, and release any application on any platform"
arch=('x86_64')
url="https://www.waypointproject.io/"
license=('MPL2')
makedepends=('go' 'go-bindata')
optdepends=('docker: for local development server')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hashicorp/waypoint/archive/v$pkgver.tar.gz")
sha512sums=('527e1e371c6bcb5159548de27796b815969b928a6fb56d7e9199c51a28ea7a983b93a7973dd5b0283ce5254127d7176ae9f0b6a428908e98a84b21d448a2b823')
b2sums=('81d3846378804a24d24ea711233507a128e69eee7ee5f0d0befbb6763ce3c74c930f3393c6a8ad8900bf1a777fa410ec1d807469743ef841e55f4158dece1b6d')

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  # build process extracted from Makefile
  cd "$pkgname-$pkgver"
  go build \
    -o ./internal/assets/ceb/ceb \
    ./cmd/waypoint-entrypoint

  cd internal/assets
  go-bindata \
    -pkg assets \
    -o prod.go \
    -tags assetsembedded \
    ./ceb

  cd "$srcdir/$pkgname-$pkgver"
  go build \
    -tags assetsembedded \
    -o ./waypoint \
    ./cmd/waypoint
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 "$pkgname" -t "$pkgdir/usr/bin"

  # documentation
  install -vDm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  cp -vr contrib/serverinstall/kind-k8s "$pkgdir/usr/share/doc/$pkgname"
  rm -vf "$pkgdir/usr/share/doc/$pkgname/.gitignore"
}
