# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=vangen
pkgver=1.4.0
pkgrel=1
pkgdesc="Tool for generating static HTML for Go vanity import paths"
arch=(x86_64)
url=https://github.com/leighmcculloch/vangen
license=(MIT)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
sha256sums=('5b10eb21f586d910a4cbd33381d53a22db0d610d33da620803e0478772810b5d')

prepare() {
  cd $pkgname-$pkgver
  export GOPATH="$srcdir/gopath"
  go mod download
}

check() {
  cd $pkgname-$pkgver
  export GOPATH="$srcdir/gopath"
  go test -mod=readonly -v ./...
}

build() {
  cd $pkgname-$pkgver

  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  go build -o vangen \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags "-s -w -linkmode external -extldflags \"${LDFLAGS}\""
}

package() {
  cd $pkgname-$pkgver

  install -Dm0755 $pkgname "$pkgdir/usr/bin/$pkgname"

  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=2 sw=2 et:
