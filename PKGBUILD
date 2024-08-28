# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="gsa"
_pkgname="go-size-analyzer"
pkgname="${_pkgname}-git"
pkgver=1.7.0.r0.g58ac937
pkgrel=1
pkgdesc="A tool for analyzing the dependencies in compiled Golang binaries"
arch=('x86_64')
url="https://${_binname}.zxilly.dev"
_url="https://github.com/Zxilly/${_pkgname}"
license=('AGPL-3.0-only')
makedepends=('git' 'go')
depends=('glibc')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${_url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  # install -Dm644 "README_zh_CN.md" "${pkgdir}/usr/share/doc/${__pkgname}/README_zh_CN.md"
  install -Dm644 "LICENSE"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
