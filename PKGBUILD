# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Alan Jenkins <alan.james.jenkins@gmail.com>

pkgname=tfk8s
pkgver=0.1.10
pkgrel=1
pkgdesc="A tool for converting Kubernetes YAML manifests to Terraform HCL"
arch=(x86_64)
url=https://github.com/jrhouston/tfk8s
license=(MIT)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
sha256sums=('be2680e76311ac7dd814a1bb0dceb486e3511d8d68845421338f9fcf5a92d5f9')

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

  go build -o tfk8s \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" -X main.toolVersion=${pkgver}"
}

package() {
  cd $pkgname-$pkgver

  install -vDm0755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -vDm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -vDm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=2 sw=2 et:
