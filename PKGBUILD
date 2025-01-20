# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="envman"
pkgname="${_pkgname}-git"
pkgver=2.5.1.r0.g7e737fe
pkgrel=1
pkgdesc="Manage Environment Variable collections"
arch=('aarch64' 'x86_64')
url="https://github.com/bitrise-io/${_pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
  go build -o "build/${_pkgname}" .
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  go test ./... 
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
