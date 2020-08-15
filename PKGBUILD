# Maintainer: ml <ml@visu.li>
pkgname=golang-mockery
_pkgname=${pkgname##golang-}
pkgver=2.2.1
pkgrel=1
pkgdesc='A mock code autogenerator for golang'
arch=('x86_64')
url='https://github.com/vektra/mockery'
license=('BSD')
depends=('glibc')
makedepends=('go')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('df0653da0323348b9dcc63cd8b8741a96a777d962a87e002b2fdb3c67118c985')

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
