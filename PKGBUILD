# Maintainer: David Birks <david@birks.dev>

pkgname=beads
pkgver=0.49.0
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
b2sums=('62f7373924cfc50787ee108f1e0293415f20da902b0bc229cc6a61ed88542804696d527adfb038f1cc2f3acfbc77f86530414bf7e2095fc8da29fefce786d34a')

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
