# Maintainer: René 'Necoro' Neumann <arch@necoro.dev>
pkgname=arch-log
pkgver=0.2.0
pkgrel=1
pkgdesc='Quickly check commit log of Arch and AUR packages.'
arch=('x86_64')
url="https://github.com/Necoro/$pkgname"
license=('GPL')
makedepends=('go>=1.20')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('575410dd4e452a805809dcca70ea595868c937b12586037d312a289d13feef37')

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
