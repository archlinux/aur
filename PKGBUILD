# Maintainer: Jonas Pucher <jonaas.pucher000000@gmail.com>

pkgname=samurai-select
pkgver=1.24.1
pkgrel=1
pkgdesc="A screen selection tool for wayland compositors using the layer shell"
arch=("x86_64" "aarch64")
url="https://github.com/Samudevv/${pkgname}"
license=("ZLIB")
depends=("samurai-render")
makedepends=("go" "scdoc" "gzip")
optdepends=(
  "grim: Required to take screenshots with the -s|--screenshot flag"
)
source=(
  "${pkgname}-${pkgver}::https://github.com/Samudevv/samurai-select/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
  "a4598e903c6e2ef89bbe3474ad880cfbe0ff3aa0f6448720bd199902361fe867"
)

prepare() {
  rm -rf "${srcdir}/gopath"
  mkdir -p "${srcdir}/gopath/src/github.com/Samudevv"
  ln -rTsf "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/gopath/src/github.com/Samudevv/${pkgname}"
}

build() {
  cd "${srcdir}/gopath/src/github.com/Samudevv/${pkgname}"
  export GOPATH="${srcdir}/gopath"
  export PATH="${PATH}:${GOPATH}/bin"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GO_FLAGS="-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw -x -v"

  # Fix version string
  sed -i 's/11/12/g' version.go

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
