# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: George Rawlinson <george@rawlinson.net.nz>
pkgname=air
pkgver=1.63.1
pkgrel=1
pkgdesc="Live reload for Go apps"
arch=(x86_64)
url="https://github.com/${pkgname}-verse/${pkgname}"
license=(GPL-3.0-or-later)
depends=(glibc go)
makedepends=(git)
options=('!lto')
_commit='0ca6b6306cd1205a6c9fe79f76b710260797fec7'
source=("${pkgname}::git+${url}.git#commit=${_commit}")
b2sums=('8ab01da6cf35afd8e8526aad8610a4108f92b8f42a118ab3322c90c6ec8a01694153fb2799e117df530dfc6f4c17767c5cb0346378854b9424cd5ec8a12d3ca6')

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
