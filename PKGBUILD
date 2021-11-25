# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=air
pkgver=1.27.5
pkgrel=1
pkgdesc="Live reload for Go apps"
arch=('x86_64')
url="https://github.com/cosmtrek/air"
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('9c5f0c8b08b8558e0a16cd87572c8fa311ca656681b7ab11d24c5c2cd4f0c59ca0a722e8d243e98a31fbc221f63ecd57e62985e2ba0af7e1ef99334554752ac0')
b2sums=('542d7b21d76fd93db5421fe5da280873ebd612c177010ea7d6aae2045aee0d8addae522571199584f87e22ded86a59e6dee89ed0090aee9e8a8248fd1699d9cd')

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
