# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=oddshub
pkgver=0.0.4
pkgrel=1
pkgdesc="Terminal UI for analyzing sports betting odds"
arch=('x86_64' 'aarch64')
url="https://github.com/dos-2/oddshub"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('b23348a40b3744373ca0bef47d21d63c41913b49c6a062630990eeb523709c3c')

_goenv() {
  export CGO_CPPFLAGS="$CPPFLAGS" CGO_CFLAGS="$CFLAGS" CGO_CXXFLAGS="$CXXFLAGS" CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  export GOPATH="$srcdir/gopath" GOTOOLCHAIN=local
}

prepare() {
  cd "oddshub-${pkgver}"
  _goenv
  go mod download
}

build() {
  cd "oddshub-${pkgver}"
  _goenv
  go build -ldflags "-linkmode=external" -o build/oddshub .
}

package() {
  cd "oddshub-${pkgver}"
  install -Dm755 build/oddshub -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
