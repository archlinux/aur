# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=apicompat-git
_pkgname=apicompat
pkgver=r125.5f916b1
pkgrel=3
pkgdesc="Checks recent changes to a Go project for backwards incompatible changes"
arch=('x86_64')
url='https://abicheck.bradleyf.id.au'
license=('MIT')
provides=('apicompat')
depends=('glibc')
makedepends=('git' 'go')
source=("apicompat::git+https://github.com/bradleyfalzon/apicompat")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
   git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/apicompat"
  mkdir -p build/
}

build() {
  cd "${srcdir}/apicompat"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go get -d -v ./...
  go build -o build ./cmd/...
}

package() {
  cd "${srcdir}/apicompat"
  install -Dm755 build/apicompat "${pkgdir}/usr/bin/apicompat"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}