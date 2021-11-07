# Maintainer: Cynthetika <opensourceATcynthetikaDOTcom>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mimemagic
pkgver=1.2.0
pkgrel=1
pkgdesc="Powerful and versatile MIME sniffing package using pre-compiled glob patterns, magic number signatures, XML document namespaces, and tree magic for mounted volumes, generated from the XDG shared-mime-info database"
arch=('any')
url='https://godoc.org/github.com/zRedShift/mimemagic'
license=('GPL2')
depends=('glibc')
makedepends=('go')
conflicts=("$pkgname-git")

source=("$pkgname-$pkgver.tar.gz::https://github.com/zRedShift/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('7131b6be01748a5a3498ae2f518e53f3a72bfd87e6208b5dc8cc8ecf948d6629')

prepare() {
  cd "$pkgname-$pkgver"

  # create build output directory if not present
  mkdir -p build

  # update module fetching method for Go version >1.17
  go mod tidy

  # download Go module dependencies
  go mod download
}

build() {
  cd "$pkgname-$pkgver"

  # set build flags per Arch hardening recommendations
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="-Wl,-O1,--sort-common,-z,relro,-z,now"
  export GOFLAGS=" \
    -buildmode=pie \
    -trimpath \
    -ldflags=-linkmode=external \
    -ldflags=-extldflags=-Wl,-O1,--sort-common,-z,relro,-z,now \
    -mod=readonly \
    -modcacherw \
  "

  # recursively build all project binaries
  go build -o build ./cmd/...
}

check() {
  cd "$pkgname-$pkgver"

  # run build test
  go test
}

package() {
  cd "$pkgname-$pkgver"

  # install built Go binaries
  install -Dm 755 -t "$pkgdir/usr/bin" build/$pkgname
  install -Dm 755 -t "$pkgdir/usr/bin" build/parser

  # install project "readme" documentation
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
