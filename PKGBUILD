# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: George Rawlinson <george@rawlinson.net.nz>
pkgname=air
pkgver=1.52.1
pkgrel=1
pkgdesc="Live reload for Go apps"
arch=(x86_64)
url="https://github.com/cosmtrek/${pkgname}"
license=(GPL-3.0-or-later)
depends=(glibc go)
makedepends=(git)
options=('!lto')
_commit='e3b6eafe8afd4ac8640421bad573ea5e655592cd'
source=("${pkgname}::git+${url}.git#commit=${_commit}")
b2sums=('ae431e14a03a31a9d1f95fe3000b7120db5fd9e0989583f568e29873255842c14628bc9e9d55ab0a04e4b3f6cb672e3e95555f2234061f8ddadce2b16df9b3ae')

pkgver() {
  cd ${pkgname}
  git describe --tags | sed 's/^v//'
}

prepare() {
  # set Go flags
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=0

  cd ${pkgname}
  # create directory for build output
  mkdir -p build
  # download dependencies
  go mod download
}

build() {
  cd ${pkgname}
  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS} \
    -X main.airVersion=$pkgver \
    -X main.goVersion=$(go env GOVERSION | sed 's/^go//')" \
    -o build \
    .
}

# check() {
#   cd ${pkgname}
#   go test -v ./...
# }

package() {
  cd ${pkgname}
  # binary
  install -vDm755 -t "${pkgdir}/usr/bin" "build/${pkgname}"
  # documentation
  install -vDm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md air_example.toml
}
