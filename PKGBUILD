# Maintainer: NivekNK <79262770+NivekNK@users.noreply.github.com>
pkgname=synk
pkgver=0.4.1
pkgrel=1
pkgdesc='Generate OpenSSH config from Bitwarden profiles'
arch=('x86_64' 'aarch64')
url='https://github.com/nivek-sh/synk'
license=('MIT')
depends=('bitwarden-cli' 'openssh')
makedepends=('go')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('238f6016b78013863af19ddee5fd1c508f2f242f42ce65bed9a7bd05cdb255e2')

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
