# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=xq
pkgver=1.4.0
pkgrel=1
pkgdesc='Command-line XML and HTML beautifier and content extractor'
arch=('x86_64')
url='https://github.com/sibprogrammer/xq'
license=('MIT')
makedepends=('go')
conflicts=('yq')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6cc922d2241e10968d8985b2a8a8abe1328d8bd0ebcf5f7741d8387022436f00')

prepare() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build/
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export GOPATH="${srcdir}"
  go build -o build .
}

package() {
  cd "${pkgname}-${pkgver}"

  #binary
  install -Dm755 build/$pkgname "$pkgdir/usr/bin/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  cp -vr assets "$pkgdir/usr/share/doc/$pkgname"

  # man
  install -vDm644 docs/xq.man "$pkgdir/usr/share/man/man1/$pkgname.1"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
