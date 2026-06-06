# Maintainer: shbernal <shbernal.01@gmail.com>

_pkgname=mantisbt-cli
pkgname=${_pkgname}-git
pkgver=0.1.0.r5.gbd18ea8
pkgrel=1
pkgdesc='Command line client for the MantisBT REST API'
arch=('x86_64' 'aarch64')
url='https://github.com/overworks/mantisbt-cli'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!debug')
source=("${_pkgname}::git+${url}.git#branch=0.x")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"

  export GOPATH="${srcdir}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build \
    -ldflags "-compressdwarf=false -linkmode external -X main.version=${pkgver}" \
    -o "${_pkgname}" .
}

check() {
  cd "${_pkgname}"

  go test ./...
}

package() {
  cd "${_pkgname}"

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
