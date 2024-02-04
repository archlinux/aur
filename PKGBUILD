# Maintainer: Jerry Y. Chen <chen@jyny.dev>

pkgname=atlas-git
pkgdesc="A modern tool for managing database schemas"
pkgver=0.19.0
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

sha256sums=('e3f8a366ca7836af457798c025be4119f40ddbef13a38fb399510cd01fc8491c')
b2sums=('7b5a12497e25d84857b497f0a28bfba074744e009d171e222494c59fbe4232877f3b2fc22a0116fedc59e2f8b83efac77412f93afa5e19423c02b10478e48092')

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