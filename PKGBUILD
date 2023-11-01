# Maintainer: Jonas Pucher <jonaas.pucher000000@gmail.com>

pkgname=samurai-select
pkgver=0.1.5
pkgrel=1
pkgdesc="A screen selection tool for wayland compositors using the layer shell"
arch=("x86_64")
url="https://github.com/PucklaJ/${pkgname}"
license=("ZLIB")
depends=("wayland" "cairo")
makedepends=("git" "go" "gcc")
optdepends=(
  "grim: Required to take screenshots with the -s|--screenshot flag"
)
source=(
  "${pkgname}-${pkgver}::git+https://github.com/PucklaJ/${pkgname}.git"
)
sha256sums=(
  "SKIP"
)

prepare() {
  rm -rf "${srcdir}/gopath"
  mkdir -p "${srcdir}/gopath/src/github.com/PucklaJ"
  ln -rTsf "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/gopath/src/github.com/PucklaJ/${pkgname}"
}

build() {
  cd "${srcdir}/gopath/src/github.com/PucklaJ/${pkgname}"
  export GOPATH="${srcdir}/gopath"
  export PATH="${PATH}:${GOPATH}/bin"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GO_FLAGS="-buildmode=pie -trimpath -buildvcs=false -x -v"

  go build
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
