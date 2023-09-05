# Maintainer: M Hickford <mirth.hickford@gmail.com>
# Maintainer: Brainos <brainos233@gmail.com>
pkgname=git-credential-azure
pkgver=0.2.1
pkgrel=1
pkgdesc='Git credential helper that authenticates to Azure Repos (dev.azure.com)'
arch=('any')
url="https://github.com/hickford/git-credential-azure"
license=('APACHE')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hickford/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('f3a05c73d03b0e5e58a9cd88275422a6b4b5e2ef75fd193b0f1c972e663c96a1')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
