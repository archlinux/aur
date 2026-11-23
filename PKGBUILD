# Maintainer: NivekNK <79262770+NivekNK@users.noreply.github.com>
pkgname=synk
pkgver=0.4.2
pkgrel=1
pkgdesc='Generate OpenSSH config from Bitwarden profiles'
arch=('x86_64' 'aarch64')
url='https://github.com/nivek-sh/synk'
license=('MIT')
depends=('bitwarden-cli' 'openssh')
makedepends=('go')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('97966bf61558d007049a7a6f3107a620297c5565a501d7c8bf4efe5b24825d78')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_ENABLED=0
  export GOFLAGS="-trimpath -buildvcs=false -mod=readonly -modcacherw"
  go build -ldflags "-s -w -X synk/internal/cli.Version=${pkgver}" -o synk ./cmd/synk
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 synk "${pkgdir}/usr/bin/synk"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
