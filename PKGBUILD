# Maintainer: Sebastien Rousseau <sebastian.rousseau@gmail.com>

pkgname=scout
pkgver=0.0.7
pkgrel=1
pkgdesc='Diagnose Model Context Protocol servers end to end: nine phases, every finding tied to the request that produced it'
arch=('x86_64' 'aarch64')
url='https://github.com/sebastienrousseau/scout'
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('afcd587e7912e026ff871a82418fac1c28b7635c38aa014683e84068bc9e1539')

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  go mod download -x
}

build() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o scout \
    -ldflags "-linkmode=external -X github.com/sebastienrousseau/scout/cmd.Version=${pkgver}" \
    ./cmd/scout
  # The manpages and completions the release archives carry, generated the
  # same way the release does.
  go run ./scripts/gen_docs.go build
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 scout "${pkgdir}/usr/bin/scout"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 -t "${pkgdir}/usr/share/man/man1" build/man/*.1
  install -Dm644 build/completions/scout.bash "${pkgdir}/usr/share/bash-completion/completions/scout"
  install -Dm644 build/completions/scout.zsh "${pkgdir}/usr/share/zsh/site-functions/_scout"
  install -Dm644 build/completions/scout.fish "${pkgdir}/usr/share/fish/vendor_completions.d/scout.fish"
}
