# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_binname="flow"
_pkgname="${_binname}-cli"
pkgname="${_pkgname}-git"
pkgver=1.20.5
pkgrel=1
pkgdesc="A command-line interface that provides useful utilities for building Flow applications"
arch=('any')
url="https://docs.onflow.org/${_pkgname}"
_url="https://github.com/onflow/${_pkgname}"
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'make' 'go')
provides=("${_binname}=${pkgver%%.r*}")
conflicts=("${_binname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${_url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  git describe --long --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  [ -d "build" ] || mkdir "build"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  # go build -o "build/${_binname}" "./cmd/${_binname}"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "cmd/${_binname}/${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_binname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_binname}/LICENSE"
}
