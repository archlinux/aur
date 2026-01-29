# Maintainer: GGORG <GGORG0 at protonmail dot com>

pkgname=process-compose-git
_pkgname=${pkgname%-git}
pkgver=1.87.0.r17.gf9114c3
pkgrel=1
pkgdesc="A simple and flexible scheduler and orchestrator to manage non-containerized applications"
arch=('x86_64')
url="https://github.com/F1bonacc1/process-compose"
license=('Apache-2.0')
makedepends=('git' 'go>=1.24.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!debug')
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd "$srcdir/${_pkgname}"
  mkdir -p build/
}

build() {
  cd "$srcdir/${_pkgname}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o build/${_pkgname} ./main.go
}

check() {
  cd "$srcdir/${_pkgname}"
  go test ./...
}

package() {
  cd "$srcdir/${_pkgname}"

  install -Dm755 build/${_pkgname} "$pkgdir"/usr/bin/${_pkgname}
}
