pkgname=astartectl
pkgver=0.11.3
pkgrel=1
pkgdesc='Astarte command line client utility '
arch=('x86_64')
url="https://github.com/astarte-platform/$pkgname"
license=('GPL')
makedepends=('go')
source=("https://codeload.github.com/astarte-platform/astartectl/tar.gz/refs/tags/v$pkgver")
sha256sums=('cca087ddf3c29f7ee3a02463ca09f4e6197d52916d44da1e483a6b4f65ed29db')

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
  go build -v -o build . 
}

check() {
  cd "$pkgname-$pkgver"
  go test -v ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
