# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="okteto"
pkgname="${_pkgname}-git"
pkgver=3.2.0beta1.r21.g2b787c1
pkgrel=1
pkgdesc="Build better applications by developing and testing your code directly in Kubernetes"
arch=('x86_64' 'aarch64')
url="https://www.okteto.com"
_url="https://github.com/${_pkgname}/${_pkgname}"
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'go')
optdepends=('kubectl')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${_url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed -E 's/-([0-9]+)-/\.r\1./; s/-(beta|alpha)\./\1/g; s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  mkdir -p "build"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -v -o "build/${_pkgname}" -ldflags "\
    -X ${_url#https://}/pkg/config.VersionString=${pkgver}" \
    .
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   go test ./...
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
