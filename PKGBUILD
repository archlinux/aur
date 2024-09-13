# Maintainer: Max Gautier <mg@max.gautier.name>
pkgname=kubectl-slice
pkgver=1.3.1
pkgrel=1
pkgdesc='Split multiple Kubernetes files into smaller files with ease'
arch=('x86_64')
url="https://github.com/patrickdappollonio/$pkgname"
license=('MIT')
makedepends=('go')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1a2dd917655d2648a935633ee4b4d6015784eda596129f84b23baacb33039155')

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


