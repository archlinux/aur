pkgname=firefox-history-merger
pkgver=2.12.0
pkgrel=1
pkgdesc='A CLI application to merge Firefox history and repair missing favicons'
arch=('x86_64')
url="https://github.com/crazy-max/firefox-history-merger"
license=('GPL')
makedepends=('go')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('9d8ecdd5a8825a047d2fb64580749cc63b8dd09252ff2b17d5af45532a625f0663da7c49bcc911406a63362f94d553521c1ca492407acdc11c30cc615d9d54f3')

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
}
