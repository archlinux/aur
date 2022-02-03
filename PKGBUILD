# Maintainer: Patrick Hanft <aur at patrick-hanft dot de>
pkgname=oui
pkgver=0.1.8
pkgrel=1
pkgdesc='MAC Address CLI Toolkit'
arch=('x86_64')
url="https://github.com/thatmattlove/$pkgname"
license=('custom:The Clear BSD License')
makedepends=('go')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b3cb775c8ea6bf48b3b2bebcae7bb6c072620f11cdcf1b1092bae8fa15989e82')

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
  go build -o build
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

