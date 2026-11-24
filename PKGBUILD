# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=grofer
pkgver=1.4.1
pkgrel=1
pkgdesc="System and resource monitoring tool"
arch=('x86_64' 'aarch64')
url="https://github.com/pesos/grofer"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('fb620e7348f52e970e7435ab72614f3da1fbdf31ec11f50e131c6060d78a0495')

_goenv() {
  export CGO_CPPFLAGS="$CPPFLAGS" CGO_CFLAGS="$CFLAGS" CGO_CXXFLAGS="$CXXFLAGS" CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  export GOPATH="$srcdir/gopath" GOTOOLCHAIN=local
}

prepare() {
  cd "grofer-${pkgver}"
  _goenv
  go mod download
}

build() {
  cd "grofer-${pkgver}"
  _goenv
  go build -ldflags "-linkmode=external" -o "build/grofer" .
}

package() {
  cd "grofer-${pkgver}"
  install -Dm755 "build/grofer" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
