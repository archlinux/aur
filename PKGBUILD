# Maintainer: David Birks <david@birks.dev>

pkgname=beads
pkgver=0.48.0
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
b2sums=('98a5c950e0d487350b36e69a610a6acf9d22affc6262154eb54ecb9f4d21d5dc8a177b57745c9d97bfb2a2937e53fdbd8aceb2f3a8ae7a1d710fa843be1a9258')

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
