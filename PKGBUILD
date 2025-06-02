# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: George Rawlinson <george@rawlinson.net.nz>
pkgname=air
pkgver=1.62.0
pkgrel=1
pkgdesc="Live reload for Go apps"
arch=(x86_64)
url="https://github.com/${pkgname}-verse/${pkgname}"
license=(GPL-3.0-or-later)
depends=(glibc go)
makedepends=(git)
options=('!lto')
_commit='6ba3c07ce640f1c79ada44c41b7484ddbec893e8'
source=("${pkgname}::git+${url}.git#commit=${_commit}")
b2sums=('962631b431a366fe543fa8cfc9df249851cc91f4f4d379f47aeda2275b2e46e9d254840cdc8f01c373f60b6a959a1654da1a37ab6911e5f1061991d682143dab')

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
