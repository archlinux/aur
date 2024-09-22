# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: George Rawlinson <george@rawlinson.net.nz>
pkgname=air
pkgver=1.60.0
pkgrel=1
pkgdesc="Live reload for Go apps"
arch=(x86_64)
url="https://github.com/${pkgname}-verse/${pkgname}"
license=(GPL-3.0-or-later)
depends=(glibc go)
makedepends=(git)
options=('!lto')
_commit='90c8f9e86ed452fb328c9b648d7f8ef1dfd89359'
source=("${pkgname}::git+${url}.git#commit=${_commit}")
b2sums=('04c0c978bae7305ccad79492724da5e1248295a397d7580c23f80f2b73ad85fbe97fd102f10838464dd54f0abca398b7bc4ac336448e40d201c92ce066e1473c')

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
