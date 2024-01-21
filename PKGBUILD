# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=sys76-kb
pkgver=0.3.1
pkgrel=6
pkgdesc="RGB keyboardcontroller for System76 laptops"
arch=('x86_64')
url="https://github.com/bambash/sys76-kb"
license=('unknown')
depends=('glibc' 'system76-dkms')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('95d18be01c83bc529ad4311a5c59507d0e1568160638d9823b6c02aa6261c7e8')

prepare() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"

  # download dependencies
  go mod download -x

  # create directory for build output
  mkdir -p build
}

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -v -buildvcs=false -o build .

  # Clean module cache for makepkg -C
  go clean -modcache
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "build/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
