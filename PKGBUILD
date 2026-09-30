# Maintainer: Sebastien Rousseau <sebastian.rousseau@gmail.com>

pkgname=passmcp
pkgver=0.0.4
pkgrel=1
pkgdesc='Diagnose Model Context Protocol servers end to end: nine phases, every finding tied to the request that produced it'
arch=('x86_64' 'aarch64')
url='https://github.com/sebastienrousseau/passmcp'
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c4aa70cfc7887237285e824d0cdb4941b33a4b4c1f519e6e0710c667ef9e322c')

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
  go build -o passmcp \
    -ldflags "-linkmode=external -X satellion.com/passmcp/cmd.Version=${pkgver}" \
    ./cmd/passmcp
  # The manpages and completions the release archives carry, generated the
  # same way the release does.
  go run ./scripts/gen_docs.go build
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 passmcp "${pkgdir}/usr/bin/passmcp"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 -t "${pkgdir}/usr/share/man/man1" build/man/*.1
  install -Dm644 build/completions/passmcp.bash "${pkgdir}/usr/share/bash-completion/completions/passmcp"
  install -Dm644 build/completions/passmcp.zsh "${pkgdir}/usr/share/zsh/site-functions/_passmcp"
  install -Dm644 build/completions/passmcp.fish "${pkgdir}/usr/share/fish/vendor_completions.d/passmcp.fish"
}
