pkgname=pbgopy
pkgver=0.2.0
pkgrel=1
pkgdesc='pbgopy acts like pbcopy/pbpaste but for multiple devices. It lets you share data across devices like you copy and paste.'
arch=('any')
url="https://github.com/nakabonne/pbgopy"
license=('MIT')
makedepends=('go' 'git')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('17286437aef9e63cec82e4e9b45eb7c0bfbd3ac8633b2561e52acfac7ded1ab5')

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
  go build -o build .
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
