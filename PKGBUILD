# Maintainer: Josephine Pfeiffer <josie@archlinux.org>
pkgname=cherryctl
pkgver=0.10.0
pkgrel=3
pkgdesc='Cherry Servers CLI for managing cloud infrastructure'
arch=('x86_64' 'aarch64')
url='https://github.com/cherryservers/cherryctl'
license=('MPL-2.0')
makedepends=('go')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f035906ead30c538682ed322b2d10627de18c15ee586fe813aac9a19bfa5e064')

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="$srcdir"
  mkdir -p build/

  go mod download -modcacherw
}

build() {
  cd "${pkgname}-${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="$srcdir"
  export GOFLAGS="-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw"

  go build \
    -ldflags "-linkmode external -extldflags '${LDFLAGS}' \
      -X github.com/cherryservers/cherryctl/cmd.Version=${pkgver}" \
    -o build/cherryctl \
    .
}

check() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="$srcdir"
  export GOFLAGS="-mod=readonly -modcacherw"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 build/cherryctl "${pkgdir}/usr/bin/cherryctl"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
