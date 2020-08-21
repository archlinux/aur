# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=c4go-git
_pkgname=c4go
pkgver=r1591.8460ec2f
pkgrel=1
pkgdesc="Transpiling C code to Go code"
arch=('x86_64')
url='https://github.com/Konstantin8105/c4go'
license=('MIT')
provides=('c4go')
depends=('clang')
makedepends=('git' 'go')
source=("c4go::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p build/
}

build() {
  cd "${srcdir}/${_pkgname}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o build ./...
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 build/c4go "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}