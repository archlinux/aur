# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=opkssh
pkgname=opkssh-git
pkgver=r436.d8bdd33
pkgrel=1
pkgdesc="opkssh (OpenPubkey SSH)"
arch=('x86_64')
url="https://github.com/openpubkey/opkssh"
license=('Apache-2.0')
makedepends=('go' 'git')
source=("git+${url}.git")
provides=('opkssh')
conflicts=('opkssh')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname/-git/}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  cd "${pkgname/-git/}"
  mkdir -p build/
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "${pkgname/-git/}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build/opkssh main.go
}

check() {
  cd "${pkgname/-git/}"
  go test ./...
}

package() {
  cd "${pkgname/-git/}"
  install -Dm755 build/${_pkgname} "$pkgdir"/usr/bin/${pkgname/-git/}
}
