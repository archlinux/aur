# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=dstp-git
pkgver=r119.51b3e84
pkgrel=1
pkgdesc="Run common networking tests against your site"
arch=('any')
url="https://github.com/ycd/dstp"
license=('MIT')
provides=('dstp')
conflicts=('dstp')
makedepends=('go' 'git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname/-git/}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  cd "${pkgname/-git/}"
  mkdir -p build/
}

build() {
  cd "${pkgname/-git/}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build cmd/dstp/dstp.go
}

check() {
  cd "${pkgname/-git/}"
  go test ./...
}

package() {
  cd "${pkgname/-git/}"
  install -Dm755 build/dstp "$pkgdir"/usr/bin/${pkgname/-git/}
}
