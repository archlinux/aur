# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: David Birks <david at birks dot dev>

pkgname=pluto
pkgver=5.8.0
pkgrel=1
pkgdesc="A cli tool to help discover deprecated apiVersions in Kubernetes"
arch=(x86_64)
url=https://github.com/FairwindsOps/pluto
license=(Apache)
depends=(glibc)
makedepends=(go pkger)
source=("$pkgname-$pkgver.tar.gz::https://github.com/FairwindsOps/pluto/archive/v$pkgver.tar.gz")
sha256sums=('897c87edde1bc5e4f9ebbc1b8e40982fbb1e3875492310ca1c0d31a7cea32768')

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
