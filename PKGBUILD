# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=paqet
pkgver=1.0.0_alpha.14
pkgrel=2
pkgdesc="Ferries Packets Across Forbidden Boundaries"
arch=("any")
url="https://github.com/hanselime/paqet"
license=("MIT")
makedepends=("git" "go")
source=("git+${url}.git#tag=v${pkgver//_/-}")
sha256sums=('de5f6a9a40fb82b32d97d695c8c0c24790dd5d02b3a75f73c6e380c84d66ddba')

build() {
  cd "${srcdir}/${pkgname}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  go build -o paqet_${pkgver//_/-}-${pkgrel} \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external \
              -X paqet/cmd/version.Version=v${pkgver//_/-} \
              -X paqet/cmd/version.GitCommit=$(git rev-parse --short HEAD) \
              -X paqet/cmd/version.GitTag=$(git describe --tags --exact-match 2>/dev/null || echo unknown)
              -extldflags \"$LDFLAGS\"" \
    ./cmd/main.go
}

package() {
    cd "${srcdir}/${pkgname}"
    install -D -m 755 "paqet_${pkgver//_/-}-${pkgrel}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
