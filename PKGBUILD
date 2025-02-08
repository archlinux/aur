# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: simonsmh <simonsmh@gmail.com>

_name="okteto"
pkgname="${_name}-beta"
pkgver=3.4.0
_pkgver="${pkgver//beta/-beta\.}"
pkgrel=1
pkgdesc="Build better applications by developing and testing your code directly in Kubernetes"
arch=('aarch64' 'x86_64')
url="https://www.okteto.com"
_url="https://github.com/${_name}/${_name}"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
optdepends=('kubectl')
provides=("${_name}")
conflicts=("${_name}")
_pkgsrc="${_name}-${_pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('2b307e9c501b2052d4e17fb268630861242d65bbdf20047ff4a53e8a51589160')

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
  go build -v -o "build/${_name}" -ldflags "\
    -X ${_url#https://}/pkg/config.VersionString=${pkgver}" \
    .
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   go test ./...
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${_name}" "${pkgdir}/usr/bin/${_name}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_name}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}
