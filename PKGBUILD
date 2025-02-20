# Maintainer:
# Contributor: Pieter Joost van de Sande <pj@born2code.net>

pkgname=reftools-git
pkgver=r62.f5f96ef
pkgrel=1
epoch=1
pkgdesc='refactoring tools for Go'
url='https://github.com/davidrjenni/reftools'
arch=('x86_64')
license=('BSD-2-Clause')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
makedepends=('git' 'go')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd reftools
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd reftools
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o fillstruct ./cmd/fillstruct
  go build -o fillswitch ./cmd/fillswitch
  go build -o fixplurals ./cmd/fillswitch
}

package() {
  cd reftools
  install -Dm755 fillstruct fillswitch fixplurals -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et
