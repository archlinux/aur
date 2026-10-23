# Maintainer: horizzon3507 <148660626+horizzon3507@users.noreply.github.com>
# Upstream: https://github.com/smoothyy3/tardigrade
#
# The creature is a 96 KB set of learned weights baked into the binary; there is
# no image of it anywhere. Building from the tagged source keeps that promise
# verifiable instead of trusting a prebuilt blob.

pkgname=tardigrade
pkgver=0.1.1
pkgrel=1
pkgdesc="Self-healing creature of learned weights that lives in your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/smoothyy3/tardigrade"
license=('MIT')
makedepends=('go' 'git')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

export CGO_ENABLED=0
export GOFLAGS="-mod=mod -buildvcs=false"

build() {
  cd "${pkgname}"
  export GOPATH="${srcdir}/gopath"
  export GOCACHE="${srcdir}/gocache"
  go build -trimpath \
    -ldflags "-s -w -X main.version=v${pkgver}" \
    -o "${pkgname}" ./cmd/tardigrade
}

check() {
  cd "${pkgname}"
  export GOPATH="${srcdir}/gopath"
  export GOCACHE="${srcdir}/gocache"
  go test ./...
}

package() {
  cd "${pkgname}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
