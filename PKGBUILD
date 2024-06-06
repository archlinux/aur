# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: George Rawlinson <george@rawlinson.net.nz>
pkgname=air
pkgver=1.52.2
pkgrel=1
pkgdesc="Live reload for Go apps"
arch=(x86_64)
url="https://github.com/cosmtrek/${pkgname}"
license=(GPL-3.0-or-later)
depends=(glibc go)
makedepends=(git)
options=('!lto')
_commit='32b22d6c7fb4a2d388e1da529e602b3e719ea971'
source=("${pkgname}::git+${url}.git#commit=${_commit}")
b2sums=('29d698d27c0669f761435f0f107da5d67d17712eb247a2ac1e765d10daaf472aa78398c3d0ff6abec9e91acd2fb3b8c78d11e814f8377247b05d288632db7687')

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
