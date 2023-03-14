# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=cloudlens
pkgver=0.1.1
pkgrel=1
pkgdesc="k9s like CLI for AWS"
arch=(x86_64)
url=https://github.com/one2nc/cloudlens
license=(Apache)
depends=(glibc)
makedepends=(git go)
source=(git+${url}.git#tag=v${pkgver})
sha256sums=('SKIP')

prepare() {
  cd $pkgname

  export GOPATH="$srcdir/gopath"
  go mod download

  sed -i \
    's/-ldflags "/-ldflags "-linkmode external -extldflags \"${LDFLAGS}\" /' \
    Makefile
  sed -i \
    's/-o ${OUTPUT_BIN}/-o ${OUTPUT_BIN} -trimpath -buildmode=pie -mod=readonly /' \
    Makefile
}

check() {
  cd $pkgname
  export GOPATH="$srcdir/gopath"
  go test -mod=readonly -v ./...
}

build() {
  cd $pkgname

  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  make
}

package() {
  cd $pkgname

  install -Dm0755 execs/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
