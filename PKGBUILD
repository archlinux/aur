# Maintainer: Rainu <mqtt-shell@raysha.de>
pkgname=mqtt-shell
pkgver=2.3.0
pkgrel=1
pkgdesc='A interactive shell-like command line interface (CLI) for MQTT written in go.'
arch=('x86_64' 'i686')
url="https://github.com/rainu/mqtt-shell"
license=('MIT')
makedepends=('git' 'go>=1.14')
source=("git+$url.git#tag=v$pkgver")
sha256sums=("SKIP")

prepare(){
  cd "$srcdir/$pkgname"
  mkdir -p build/
}

build() {
  GIT_REV=$(cd "$srcdir/$pkgname"; git rev-parse --short HEAD)
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "$srcdir/$pkgname"
  go build -o build -ldflags="-X main.ApplicationVersion=v$pkgver -X main.ApplicationCodeRev=$GIT_REV" ./cmd/...
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

