# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=ddosify-git
pkgver=r266.7658c83
pkgrel=1
pkgdesc="High-performance load testing tool"
arch=('any')
url="https://github.com/ddosify/ddosify"
license=('AGPL3')
makedepends=('go' 'git')
source=("git+${url}.git")
provides=('ddosify')
conflicts=('ddosify')
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
  go build -o build .
}

check() {
  cd "${pkgname/-git/}"
  go test ./...
}

package() {
  cd "${pkgname/-git/}"
  install -Dm755 build/${pkgname/-git/} "$pkgdir"/usr/bin/${pkgname/-git/}
}
