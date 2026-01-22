# Maintainer: David Birks <david@birks.dev>

pkgname=gastown
pkgver=0.5.0
pkgrel=1
pkgdesc='Multi-agent orchestration system for Claude Code with persistent work tracking'
arch=('x86_64')
url='https://github.com/steveyegge/gastown'
license=('MIT')
provides=('gt')
depends=('git')
makedepends=('go')
optdepends=(
  'beads: For git-backed issue tracking integration'
  'tmux: Recommended for multi-agent sessions'
)
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/steveyegge/gastown/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('09e96ed400eb8e6b336583fe02213c9a7e8eb77177af8f77ccda66656fdd9b0d334f469540e2a63ab352accf61b576ee87d289eb6537752a3e4e4af543d35ec6')

build() {
  cd "$pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -ldflags "-X main.Version=${pkgver}" -o gt ./cmd/gt
}

package() {
  cd "$pkgname-$pkgver"

  # Install binary
  install -Dm755 gt "${pkgdir}/usr/bin/gt"

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Generate and install shell completions
  install -dm755 "${pkgdir}/usr/share/bash-completion/completions"
  install -dm755 "${pkgdir}/usr/share/zsh/site-functions"
  install -dm755 "${pkgdir}/usr/share/fish/vendor_completions.d"

  "${pkgdir}/usr/bin/gt" completion bash > "${pkgdir}/usr/share/bash-completion/completions/gt"
  "${pkgdir}/usr/bin/gt" completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_gt"
  "${pkgdir}/usr/bin/gt" completion fish > "${pkgdir}/usr/share/fish/vendor_completions.d/gt.fish"

  # Clean up Go cache
  go clean -modcache
}
