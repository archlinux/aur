# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=air
pkgver=1.27.8
pkgrel=1
pkgdesc="Live reload for Go apps"
arch=('x86_64')
url="https://github.com/cosmtrek/air"
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('3a63da40296810b58e595ac3e543656bcc4ba4052be8f429050dacabb0bcdc40dc57200d138722b4733403e5c9ccafab712c0ffc2131fce9801654b0b2bbeb35')
b2sums=('fbedb7af3bfac93c37c294242e2f22da073656ce7f825da1a82b11a71c3ff8d050978d70a083c18b1cf81206c0ab5b687e020b742e126c1f4a6b22521f7910b9')

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
