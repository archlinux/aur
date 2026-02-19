# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=paqet
pkgver=1.0.0_alpha.17
pkgrel=1
pkgdesc="Ferries Packets Across Forbidden Boundaries"
arch=("any")
url="https://github.com/hanselime/paqet"
license=("MIT")
depends=("libpcap")
makedepends=("git" "go")
source=("git+${url}.git#tag=v${pkgver//_/-}")
sha256sums=('17b6ffbd6d497667ebfea008ac576ba6eec815fd412dd7cd0f63b2bb97b322d9')

prepare() {
  cd "${srcdir}/${pkgname}"
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

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
