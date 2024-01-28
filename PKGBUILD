# Maintainer: Jerry Y. Chen <chen@jyny.dev>

pkgname=atlas-git
pkgdesc="A modern tool for managing database schemas"
pkgver=0.18.0
pkgrel=1
binary=atlas
arch=("x86_64")
makedepends=("go")

license=("Apache-2.0")
provides=('atlas')
conflicts=('atlas')
url="https://github.com/ariga/${binary}"
source=(
  "${binary}-${pkgver}.tar.gz::https://github.com/ariga/${binary}/archive/v${pkgver}.tar.gz"
)

sha256sums=('2d7a889380caeafbc318e25bc67a8acd8921a0d345a9ef0fa590a59c64a676bb')
b2sums=('aaed7ae035136ecea24943aa83e23bb8c0bbb8bed4e12e325bf286070211b93c1a420b64a6f6776066c826f6e7beaabb2a940b0a534f06ac5b13ecc391db1a07')

prepare() {
  cd "${srcdir}/${binary}-${pkgver}"
}

build() {
  export GOPATH="${srcdir}/.go"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw -x -v"

  cd "${srcdir}/${binary}-${pkgver}/cmd/${binary}"
  go build -ldflags "-X 'ariga.io/atlas/cmd/atlas/internal/cmdapi.version=v${pkgver}'" .

  go clean -x -modcache
}

package() {
  install -Dm755 "${srcdir}/${binary}-${pkgver}/cmd/${binary}/${binary}" "${pkgdir}/usr/bin/${binary}"
}