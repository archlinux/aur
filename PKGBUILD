# Maintainer: ml <ml@visu.li>
pkgname=golang-mockery
_pkgname=${pkgname##golang-}
pkgver=2.3.0
pkgrel=1
pkgdesc='A mock code autogenerator for golang'
arch=('x86_64')
url='https://github.com/vektra/mockery'
license=('BSD')
depends=('glibc')
makedepends=('go')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ec373ef32fccdd1b9277e0de7c19b37fb1b64d7a230831cc0d41033f554e15df')

prepare() {
  cd "${_pkgname}-${pkgver}"
  go mod download
}

build() {
  cd "${_pkgname}-${pkgver}"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -modcacherw -mod=readonly -trimpath'
  go build -o bin/${_pkgname} -ldflags "-linkmode=external -X github.com/vektra/mockery/mockery.SemVer=${pkgver}"
}

check() {
  cd "${_pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dm755 bin/${_pkgname} -t "${pkgdir}/usr/bin"
  install -Dm755 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
