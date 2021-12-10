# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=waypoint
pkgver=0.6.3
pkgrel=1
pkgdesc="A tool to build, deploy, and release any application on any platform"
arch=('x86_64')
url="https://www.waypointproject.io/"
license=('MPL2')
makedepends=('go' 'go-bindata')
optdepends=('docker: for local development server')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hashicorp/waypoint/archive/v$pkgver.tar.gz")
sha512sums=('facfee26dc1a274a9262929bc985c1881e8fe8cbaefa4c1ba50de1ce943da9b0cb52a58422be8d7d34dd94205b0901b4b319a3320da66369f9c89d41e9defdf0')
b2sums=('4862227d5e42be93a528f2f80ed900835475eb507745d394d8102198209d8212729ef6340e175ff2428ba8bd06b4df0643a15dba852a2e3691c8a3340ca197b0')

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
