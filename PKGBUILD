# Maintainer: Mark Hegreberg <aur@hegreberg.io>

pkgname=moribito-git
_pkgname="${pkgname%-git}"
pkgver=0.2.5.r20.g73bd3f8
pkgrel=1
pkgdesc='a TUI based LDAP server explorer'
arch=(x86_64 aarch64)
url='https://github.com/ericschmar/moribito'
license=('MIT')
makedepends=(git go)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare() {
  cd "${_pkgname}"
  mkdir -p bin/
}

build() {
  cd "${_pkgname}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  
  #taken from make file to set version
  
  go build \
    -ldflags "-linkmode external -X github.com/ericschmar/moribito/internal/version.Version=${pkgver}" \
  	-o bin/moribito \
  	cmd/moribito/main.go
      
}

check() {
  #tests seem to be broken upstream currently
  # https://github.com/ericschmar/moribito/issues/100
  cd "${_pkgname}"
  #go test -v ./...
}

package() {
  cd "${_pkgname}"
  install -Dm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
