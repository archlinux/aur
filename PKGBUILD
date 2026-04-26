# Maintainer: David Birks <david@birks.dev>

pkgname=beads
pkgver=1.0.3
pkgrel=1
pkgdesc='Git-backed issue tracking system designed for AI coding agents'
arch=('x86_64')
url='https://github.com/steveyegge/beads'
license=('MIT')
provides=('bd')
depends=('git')
makedepends=('go')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/steveyegge/beads/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('c02c5a75cd8f8d0f6838f8da2c4209c78e149e8f7b41e9852f65ff90f3a4a59690b9a3617b09ce3d54114cc8c2afac95b301a92aab1ad96022892cacf81a3b54')

build() {
  cd "$pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -ldflags "-X main.Version=${pkgver}" -o bd ./cmd/bd
}

package() {
  cd "$pkgname-$pkgver"

  # Install binary
  install -Dm755 bd "${pkgdir}/usr/bin/bd"

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Generate and install shell completions
  install -dm755 "${pkgdir}/usr/share/bash-completion/completions"
  install -dm755 "${pkgdir}/usr/share/zsh/site-functions"
  install -dm755 "${pkgdir}/usr/share/fish/vendor_completions.d"

  "${pkgdir}/usr/bin/bd" completion bash > "${pkgdir}/usr/share/bash-completion/completions/bd"
  "${pkgdir}/usr/bin/bd" completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_bd"
  "${pkgdir}/usr/bin/bd" completion fish > "${pkgdir}/usr/share/fish/vendor_completions.d/bd.fish"

  # Clean up Go cache
  go clean -modcache
}
