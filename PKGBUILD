# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=postbear
pkgver=1.0.1
pkgrel=1
pkgdesc="Lightweight terminal API client"
arch=('x86_64' 'aarch64')
url="https://github.com/carban/postbear"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('23579fa8f9244efe62d9d21fc599cc30bfe65876d8f9583494a488d251ee17e0')

_goenv() {
  export CGO_CPPFLAGS="$CPPFLAGS" CGO_CFLAGS="$CFLAGS" CGO_CXXFLAGS="$CXXFLAGS" CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  export GOPATH="$srcdir/gopath" GOTOOLCHAIN=local
}

prepare() {
  cd "postbear-${pkgver}"
  _goenv
  go mod download
}

build() {
  cd "postbear-${pkgver}"
  _goenv
  go build -ldflags "-linkmode=external" -o "build/postbear" .
}

package() {
  cd "postbear-${pkgver}"
  install -Dm755 "build/postbear" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
