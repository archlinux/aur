# Maintainer: M Hickford <mirth.hickford@gmail.com>
# Maintainer: Brainos <brainos233@gmail.com>
pkgname=git-credential-azure
pkgver=0.3.0
pkgrel=1
pkgdesc='Git credential helper that authenticates to Azure Repos (dev.azure.com)'
arch=('any')
url="https://github.com/hickford/git-credential-azure"
license=('Apache-2.0')
makedepends=('go')
conflicts=('git-credential-azure-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hickford/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('fefa8e8f011cfc02c86fb9d7178f3d1819eb99ef107aeab877ea550e184b655c')

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
  install -Dm0644 git-credential-azure.1 -t "$pkgdir"/usr/share/man/man1/
}
