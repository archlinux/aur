# Maintainer: René 'Necoro' Neumann <arch@necoro.dev>
pkgname=arch-log
pkgver=0.4.0
pkgrel=1
pkgdesc='Quickly check commit log of Arch and AUR packages.'
arch=('x86_64')
url="https://github.com/Necoro/$pkgname"
license=('GPL')
makedepends=('go>=1.21')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('760ce31d8eb38adf8c7426da4a938a39ca6e3fee1bf5a4e68a6d78d90777dccb')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"

  ldflags="-s -w"
 
  # Flags as per Arch Guidelines
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  
  go build -o build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags="-linkmode external $ldflags"
}

check() {
  cd "$pkgname-$pkgver"
  go vet ./...
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
