# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pdfjuicer
pkgver=1.0.0
pkgrel=1
pkgdesc="Convert PDF pages to images with custom sizing and scaling"
arch=('x86_64' 'aarch64')
url="https://github.com/dmikhr/pdfjuicer"
license=('AGPL-3.0-only')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('37bcd0c436e2ad8cedaf954e0f04c52e0d08c4121fa3f33234d406742b3a58a8')

_goenv() {
  export CGO_CPPFLAGS="$CPPFLAGS" CGO_CFLAGS="$CFLAGS" CGO_CXXFLAGS="$CXXFLAGS" CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  export GOPATH="$srcdir/gopath" GOTOOLCHAIN=local
}

prepare() {
  cd "pdfjuicer-${pkgver}"
  _goenv
  go mod download
}

build() {
  cd "pdfjuicer-${pkgver}"
  _goenv
  go build -ldflags "-linkmode=external" -o "build/pdfjuicer" ./cmd
}

package() {
  cd "pdfjuicer-${pkgver}"
  install -Dm755 "build/pdfjuicer" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
