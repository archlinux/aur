# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="gsa"
pkgname="go-size-analyzer"
pkgver=1.7.3
pkgrel=1
pkgdesc="A tool for analyzing the dependencies in compiled Golang binaries"
arch=('x86_64')
url="https://${_binname}.zxilly.dev"
_url="https://github.com/Zxilly/${pkgname}"
license=('AGPL-3.0-only')
makedepends=('go')
depends=('glibc')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('74ac8657bcb39b27e463ef050221ca7ced5ef2c971f01db0f23c9bc8bb638d3ec3bd95a63ff87524f924b7ec8c708136f6e9b60694c597e26c1a8e00ded9d517')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  mkdir -p "build"
}

build() {
  local build_date=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

  cd "${srcdir}/${_pkgsrc}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "build/${_binname}" -ldflags "\
    -X ${_url#https://}.version=${pkgver} \
    -X ${_url#https://}.buildDate=${build_date}" \
    ./"cmd/${_binname}"
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   go test ./...
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "build/${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  # install -Dm644 "README_zh_CN.md" "${pkgdir}/usr/share/doc/${_pkgname}/README_zh_CN.md"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
