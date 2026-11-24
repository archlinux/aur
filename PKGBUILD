# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ward
pkgver=0.4.2
pkgrel=1
pkgdesc="Security scanner for Laravel applications"
arch=('x86_64' 'aarch64')
url="https://github.com/eljakani/ward"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('797377189ab5394dcc74a489df9238fdb4e548c784699de7907f668d58f86ae9')

_goenv() {
  export CGO_CPPFLAGS="$CPPFLAGS" CGO_CFLAGS="$CFLAGS" CGO_CXXFLAGS="$CXXFLAGS" CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  export GOPATH="$srcdir/gopath" GOTOOLCHAIN=local
}

prepare() {
  cd "ward-${pkgver}"
  _goenv
  go mod download
}

build() {
  cd "ward-${pkgver}"
  _goenv
  go build -ldflags "-linkmode=external" -o "build/ward" .
}

package() {
  cd "ward-${pkgver}"
  install -Dm755 "build/ward" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
