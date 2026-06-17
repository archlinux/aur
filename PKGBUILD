# Maintainer: Charles Dong <chardon_cs@proton.me>

pkgname=ariga-atlas
pkgdesc="Declarative schema migrations with schema-as-code workflows"
pkgver=1.2.2
pkgrel=1
_binary=atlas
arch=("x86_64")
makedepends=("go")

license=("Apache-2.0")
provides=(atlas)
conflicts=(atlas) # Although atlas is a different package, it's used for preventing duplication
url="https://github.com/ariga/${_binary}"
source=(
  "${_binary}-${pkgver}.tar.gz::https://github.com/ariga/${_binary}/archive/v${pkgver}.tar.gz"
)

sha256sums=('2710bda0aaf95df0ae896bf9124e97f407ee5f3bda22855999fbb367748b87fc')

prepare() {
  cd "${srcdir}/${_binary}-${pkgver}"
}

build() {
  export GOPATH="${srcdir}/.go"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw -x -v"

  cd "${srcdir}/${_binary}-${pkgver}/cmd/${_binary}"
  go build -ldflags "-X 'ariga.io/atlas/cmd/atlas/internal/cmdapi.version=v${pkgver}'" .

  go clean -x -modcache
}

package() {
  install -Dm755 "${srcdir}/${_binary}-${pkgver}/cmd/${_binary}/${_binary}" "${pkgdir}/usr/bin/${_binary}"
}
