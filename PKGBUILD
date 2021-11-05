# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=waypoint
pkgver=0.6.2
pkgrel=1
pkgdesc="A tool to build, deploy, and release any application on any platform"
arch=('x86_64')
url="https://www.waypointproject.io/"
license=('MPL2')
makedepends=('go' 'go-bindata')
optdepends=('docker: for local development server')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hashicorp/waypoint/archive/v$pkgver.tar.gz")
sha512sums=('33f762c6a5e06670d70c32b5d2f1000d93c825d0af5deef0db74a474d5f99098546045186dcb3e856d1d674dff7cd3b8e82298d6f1caa788f01d81fe6142b090')
b2sums=('5349891f0e2b269e29e0a77b2ff0e4ec26f52e3d5a33941370ed32f53952c3f9d551509e6a406819a10fba8a0c35ddd474730c12ba6582cd19b90711a0d14cf2')

prepare() {
  cd "$pkgname-$pkgver"

  # download dependencies
  go mod download
}

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
