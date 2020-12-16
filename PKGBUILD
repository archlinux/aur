pkgname=pbgopy
pkgver=0.2.1
pkgrel=1
pkgdesc='pbgopy acts like pbcopy/pbpaste but for multiple devices. It lets you share data across devices like you copy and paste.'
arch=('any')
url="https://github.com/nakabonne/pbgopy"
license=('MIT')
makedepends=('go' 'git')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('ab926ef65c6e8ce9e0bcfa05b658e619e34ae3554a85be99ce0ca79af3bb97a4')

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
