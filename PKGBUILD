# Maintainer: PrivateGER <privateger@privateger.me>
pkgname=patreon-dl
pkgver=1.0.1
pkgrel=2
pkgdesc='A downloader for Patreon content.'
arch=('x86_64' 'arm' 'aarch64')
url="https://github.com/PrivateGER/patreon-dl"
license=('Unlicense')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1cd9d5123f4af5c9ca93c655f376c3d65ec7c5a13cdd505eb502ce9dc93b21b8')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="-D_FORTIFY_SOURCE=2"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="-Wl,-z,relro,-z,now"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -ldflags "-X main.version=$pkgver" -o build ./...
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
