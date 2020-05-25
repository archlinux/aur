# Maintainer: ml <ml@visu.li>
pkgname=golang-mockery
_pkgname=${pkgname##golang-}
pkgver=1.1.2
pkgrel=1
pkgdesc='A mock code autogenerator for golang'
arch=('x86_64')
url='https://github.com/vektra/mockery'
license=('BSD')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d2516fad4774252604f3a1708a1ac8f5f0162a9a1613bc65870c4018c98ed17a')

prepare() {
  cd "${_pkgname}-${pkgver}"
  go mod download
}

build() {
  cd "${_pkgname}-${pkgver}"
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw -mod=readonly'
  go build -o bin/${_pkgname} -ldflags "-X github.com/vektra/mockery/mockery.SemVer=${pkgver}" ./cmd/${_pkgname}
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
