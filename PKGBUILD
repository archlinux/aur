# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=air
pkgver=1.27.7
pkgrel=1
pkgdesc="Live reload for Go apps"
arch=('x86_64')
url="https://github.com/cosmtrek/air"
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('e3f9142efc62fbd1fc37ee031d671a53dee59f6e69b6887e69a4db53e1a964503d2481fdf63f9943ecb7a7efeb604725b844b7a21c24fd390e3f43d88b13ffa6')
b2sums=('5b85ced110aa77076b0d6ab09d5ad61882b6f36d05fe28ac7af8ab8cb9f8841a8573342f72146bf15e640c2a797761ba4307ab261fd2a99bc1a0934c8c674148')

prepare() {
  cd "$pkgname-$pkgver"

  # create directory for build output
  mkdir build

  # download dependencies
  go mod download
}

build() {
  cd "$pkgname-$pkgver"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  local goVersion="$(go version | sed -r 's/go version go(.*)\ .*/\1/')"

  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS} \
    -X main.airVersion=$pkgver \
    -X main.goVersion=$goVersion" \
    -o build .
}

check() {
  cd "$pkgname-$pkgver"
  go test -v ./...
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin"  "build/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md air_example.toml
}
