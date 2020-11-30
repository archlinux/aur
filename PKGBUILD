pkgname=pbgopy
pkgver=0.1.1
pkgrel=1
pkgdesc='pbgopy acts like pbcopy/pbpaste but for multiple devices. It lets you share data across devices like you copy and paste.'
arch=('any')
url="https://github.com/nakabonne/pbgopy"
license=('MIT')
makedepends=('go' 'git')
https://github.com/nakabonne/pbgopy/archive/v0.1.1.tar.gz
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('9a48867f4dfb64924f6611e1d85e76d5d92f18a9bcdb43dd83428e70fbd44ef2')

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
}
