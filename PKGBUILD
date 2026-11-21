# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>

pkgname=kepubify
pkgver=5.0.0
pkgrel=1
pkgdesc='Convert EPUBs into Kobo EPUBs using a command-line tool'
arch=('x86_64')
url='https://pgaskin.net/kepubify/'
license=('MIT')
depends=('glibc')
makedepends=('go>=1.26.10')
conflicts=('kepubify-bin')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pgaskin/kepubify/archive/v${pkgver}.tar.gz")
sha256sums=('bd8053d3927440a9bd54022bbda697b937ab0365e55ad70b73c998233e57c030')

prepare() {
  cd "${pkgname}-${pkgver}"

  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "${pkgname}-${pkgver}"

  export GOPATH="${srcdir}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" -X github.com/pgaskin/kepubify/v5/internal.Version=v${pkgver}" \
    -o kepubify \
    .
}

check() {
  cd "${pkgname}-${pkgver}"

  export GOPATH="${srcdir}"

  go test -mod=readonly ./...
  test "$(./kepubify --version)" = "kepubify v${pkgver}"
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 kepubify "${pkgdir}/usr/bin/kepubify"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
