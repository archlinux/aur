# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="gsa"
pkgname="go-size-analyzer"
pkgver=1.11.0
pkgrel=1
pkgdesc="A tool for analyzing the dependencies in compiled Golang binaries"
arch=(
  'aarch64'
  'x86_64'
)
url="https://gsa.zxilly.dev"
_url="https://github.com/Zxilly/${pkgname}"
license=(
  'AGPL-3.0-only'
)
depends=(
  'glibc'
)
makedepends=(
  'go'
)
_pkgsrc="${pkgname}-${pkgver}"
source=(
  "${_url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
)
b2sums=('ca909d901de446c7851a61d30931db9b3b447ec4199773c5793bcd060ed22bbf203db1b68f56e095d70c8b78b65dfda043d500764ad76b83f381a4fb78b5be0a')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}"
  go mod download -modcacherw -x
  go mod verify

  mkdir -p "build"
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOCACHE="${srcdir}/go-cache"
  export GOMODCACHE="${srcdir}/go-mod-cache"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  local buildDate="$(date --utc --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +"%Y-%m-%dT%H:%M:%SZ")"

  cd "${srcdir}/${_pkgsrc}"
  go build -v -o "build/${_binname}" -ldflags "\
    -X ${_url#https://}.version=${pkgver} \
    -X ${_url#https://}.buildDate=${buildDate}" \
    ./"cmd/${_binname}"
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   go test ./...
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${_binname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  # install -vDm644 "README_zh_CN.md" "${pkgdir}/usr/share/doc/${_pkgname}/README_zh_CN.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  ln -vsf "${pkgname}" "${pkgdir}/usr/bin/${_binname}"
}
