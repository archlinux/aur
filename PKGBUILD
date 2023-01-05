# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: David Birks <david at birks dot dev>

pkgname=pluto
pkgver=5.12.0
pkgrel=1
pkgdesc="A cli tool to help discover deprecated apiVersions in Kubernetes"
arch=(x86_64)
url=https://github.com/FairwindsOps/pluto
license=(Apache)
depends=(glibc)
makedepends=(go pkger)
source=("$pkgname-$pkgver.tar.gz::https://github.com/FairwindsOps/pluto/archive/v$pkgver.tar.gz")
sha256sums=('18261d01d073110b30bd0a5699d9fbdbf618f330fc3ea57ef16fdf6eb6f0a34e')

prepare() {
  cd $pkgname-$pkgver
  export GOPATH="$srcdir/gopath"
  go mod vendor
  pkger
}

check() {
  cd $pkgname-$pkgver
  go test -mod=readonly -v ./...
}

build() {
  cd $pkgname-$pkgver

  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  go build -o pluto \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags "-s -w -linkmode external -extldflags \"${LDFLAGS}\" -X main.version=${pkgver}"
}

package() {
  cd $pkgname-$pkgver

  install -Dm0755 $pkgname "$pkgdir/usr/bin/$pkgname"

  for doc in advanced.md faq.md quickstart.md; do
    install -Dm0644 docs/$doc "$pkgdir/usr/share/doc/$pkgname/$doc"
  done
}

# vim: set ts=2 sw=2 et:
