# Maintainer: Filippo Veneri <filippo.veneri@gmail.com>
#
# Template: the release workflow sets pkgver, pkgrel and the checksum from
# the tag, then publishes it to the AUR.
pkgname=rimor
pkgver=0.3.0
pkgrel=1
pkgdesc='Terminal workbench for PostgreSQL, SQL Server and SQLite'
arch=('x86_64' 'aarch64')
url='https://rimor.dev'
license=('MIT')
depends=('glibc') # the PIE build uses the system's dynamic loader
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alchemy/rimor/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('511343b87641bd274f4d32b91f5e6c1adaca2cce0088d83fa660ce5a96c2d5fa')

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  go mod download -modcacherw
}

build() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  # Pure Go, SQLite driver included: no cgo, so no C flags to pass on.
  export CGO_ENABLED=0
  # No VCS stamping: makepkg may unpack the sources inside another git
  # repository (an AUR clone, a CI checkout), whose state is not rimor's;
  # the version comes from -ldflags instead.
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw -buildvcs=false"
  go build -ldflags "-X main.version=v${pkgver}" -o rimor ./cmd/rimor
}

check() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS="-mod=readonly -modcacherw -buildvcs=false"
  # Database server tests skip without their RIMOR_TEST_* settings.
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 rimor "${pkgdir}/usr/bin/rimor"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
