# Maintainer: David Birks <david@birks.dev>

pkgname=kat
pkgver=0.20.1
pkgrel=1
pkgdesc="TUI and rule-based rendering engine for Kubernetes manifests"
arch=('x86_64')
url="https://github.com/MacroPower/kat"
license=('Apache')
depends=()
makedepends=('go' 'gcc')
options=('!debug')
source=("https://github.com/MacroPower/kat/archive/v${pkgver}.tar.gz")
sha256sums=('fc64a82b342e94a1b05e6c7671fb0eb3395cd9cfcf5cda90efe1c3ec4126d9cd')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CPPFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags "-s -w -linkmode external -extldflags '${LDFLAGS}' -X github.com/macropower/kat/pkg/version.Version=${pkgver}" \
    -o "${pkgname}" \
    ./cmd/kat
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

