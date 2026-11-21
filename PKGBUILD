# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>

pkgname=noti
pkgver=3.9.0
pkgrel=1
pkgdesc='Monitor a process and trigger a notification'
arch=('x86_64')
url='https://codeberg.org/roble/noti'
license=('MIT')
depends=('glibc')
makedepends=('go>=1.25')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/noti${pkgver}.tar.gz")
sha256sums=('02b18016f6a78a1adf3cdcc5b20d884437edd0cf21588415e022d637372619b8')

build() {
  cd "${srcdir}"

  export GOPATH="${srcdir}/.gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=vendor \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" -X codeberg.org/roble/noti/internal/command.Version=${pkgver}" \
    -o "${pkgname}" \
    ./cmd/noti
}

check() {
  cd "${srcdir}"

  export GOPATH="${srcdir}/.gopath"
  export GOFLAGS="-mod=vendor"
  make test
}

package() {
  cd "${srcdir}"

  install -Dm755 noti "${pkgdir}/usr/bin/noti"
  install -Dm644 docs/man/dist/noti.1 "${pkgdir}/usr/share/man/man1/noti.1"
  install -Dm644 docs/man/dist/noti.yaml.5 "${pkgdir}/usr/share/man/man5/noti.yaml.5"
  install -Dm644 LICENSES/MIT.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
