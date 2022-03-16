# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: Tom Hudson <mail at tomnomnom dot com>

_srcname=assetfinder
pkgname=assetfinder-git
pkgver=r19.4e95d87
pkgrel=1
pkgdesc="Find domains and subdomains related to a given domain"
arch=('any')
url="https://github.com/tomnomnom/assetfinder"
source=("git+${url}.git")
license=('MIT')
makedepends=('go' 'git')
conflicts=('assetfinder')
provides=('assetfinder')
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
  export GO111MODULE=auto
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
