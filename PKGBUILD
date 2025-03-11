# Maintainer: Max Gautier <mg@max.gautier.name>
pkgname=kubectl-slice
pkgver=1.4.2
pkgrel=1
pkgdesc='Split multiple Kubernetes files into smaller files with ease'
arch=('x86_64')
url="https://github.com/patrickdappollonio/$pkgname"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('10c9a944ac766962ba5b57f8e93ce306abb32e5f9c88f9b9eaa9db1eb926cbb7')

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
  go build -o build ./...
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname/ LICENSE
}


