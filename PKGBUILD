# Maintainer: Jonas Pucher <jonaas.pucher000000@gmail.com>

pkgname=samurai-select
pkgver=23.11.0
pkgrel=2
pkgdesc="A screen selection tool for wayland compositors using the layer shell"
arch=("x86_64" "aarch64")
url="https://github.com/PucklaJ/${pkgname}"
license=("ZLIB")
depends=("wayland" "cairo")
makedepends=("go" "gcc" "scdoc" "gzip")
optdepends=(
  "grim: Required to take screenshots with the -s|--screenshot flag"
)
source=(
  "${pkgname}-${pkgver}::https://github.com/PucklaJ/samurai-select/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=(
  "bf9230bfd846e86b545a482bf0aa382f44163867d9cff0ddaddf15a6d431d8dd"
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
  export GO_FLAGS="-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw -x -v"

  go build
  go clean -a -cache --modcache
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -rs "${pkgdir}/usr/bin/${pkgname}" "${pkgdir}/usr/bin/smel"
  mkdir -p "${pkgdir}/usr/share/man/man1"
  scdoc < "${srcdir}/${pkgname}-${pkgver}/manpage.scd" | gzip -c > "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
  ln -rs "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/smel.1.gz"
}
