# Maintainer: Rainu <back2git@raysha.de>
pkgname=back2git
pkgver=1.2.0
pkgrel=1
pkgdesc='Watch files for changes and backup it to any git repository.'
arch=('x86_64' 'i686')
url="https://github.com/rainu/back2git"
license=('MIT')
makedepends=('git' 'go>=1.17')
source=("git+$url.git#tag=v$pkgver")
sha256sums=("SKIP")

prepare(){
  cd "$srcdir/$pkgname"
  mkdir -p build/
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "$srcdir/$pkgname"
  go build -o build ./cmd/...
}

check() {
  cd "$srcdir/$pkgname"
  go test ./...
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

