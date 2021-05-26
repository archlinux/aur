# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=ghosts
pkgver=0.2.2
pkgrel=2
pkgdesc="Tool to evaluate, compare & format host files"
arch=('x86_64')
url="https://github.com/StevenBlack/ghosts"
license=('MIT')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('21ec1aebc679a17e52c65ea77ca68ceb94429ae18e6734682525e958ecbd66d72a3777816989d3e5616355e59b5e920eb734235723085024423c4b4017a60bfa')
noextract=("$pkgname-$pkgver.tar.gz")

prepare() {
  # do not extract binaries
  bsdtar -xf "$pkgname-$pkgver.tar.gz" \
    --exclude "$pkgname-$pkgver/dist" \
    --exclude "$pkgname-$pkgver/$pkgname"

  # download dependencies
  cd "$pkgname-$pkgver"
  go mod init "${url#https://}"
  go mod tidy

  # create build directory
  mkdir -p build
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -v -o build ./...
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "build/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" license.txt

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
