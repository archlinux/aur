# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=f4go-git
_pkgname=f4go
pkgver=r587.b8b6202
pkgrel=1
pkgdesc="Transpiling fortran code to golang code"
arch=('x86_64')
url='https://github.com/Konstantin8105/f4go'
license=('MIT')
provides=('f4go')
depends=('glibc')
makedepends=('git' 'go')
source=("f4go::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/f4go"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/f4go"
  mkdir -p build/
}

build() {
  cd "${srcdir}/f4go"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o build ./...
}

package() {
  cd "${srcdir}/f4go"
  install -Dm755 build/f4go "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}