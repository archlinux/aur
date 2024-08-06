# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="gsa"
pkgname="go-size-analyzer"
pkgver=1.6.2
pkgrel=1
pkgdesc="A tool for analyzing the size of compiled Go binaries"
arch=('any')
url="https://${_binname}.zxilly.dev"
_url="https://github.com/Zxilly/${pkgname}"
license=('AGPL-3.0-or-later')
makedepends=('go')
provides=("${pkgname}" "${_binname}")
conflicts=("${pkgname}" "${_binname}")
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('825bc65a098036b06410eceb31fb3a6e194fa4a29e2edddab83592152d04b230')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  mkdir -p "build"
  go mod download
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -v -o "build/${pkgname}" .
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   go test ./...
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  # install -Dm644 "README_zh_CN.md" "${pkgdir}/usr/share/doc/${_pkgname}/README_zh_CN.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
