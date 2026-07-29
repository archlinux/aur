# Maintainer: Josephine Pfeiffer <jpfeiffe@redhat.com>

pkgname=cherryctl
pkgver=0.10.0
pkgrel=2
pkgdesc='Cherry Servers CLI for managing cloud infrastructure'
arch=('x86_64' 'aarch64')
url='https://github.com/cherryservers/cherryctl'
license=('MPL-2.0')
makedepends=('go')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f035906ead30c538682ed322b2d10627de18c15ee586fe813aac9a19bfa5e064')

prepare(){
  cd "${pkgname}-${pkgver}"
  mkdir -p build/

  go mod download -x
}

build() {
  cd "${pkgname}-${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags '${LDFLAGS}' \
      -X github.com/cherryservers/cherryctl/cmd.Version=${pkgver}" \
    -o build/cherryctl \
    .
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 build/cherryctl "${pkgdir}/usr/bin/cherryctl"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
