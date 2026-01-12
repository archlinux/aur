# Maintainer: David Birks <david@birks.dev>

pkgname=gastown
pkgver=0.2.6
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
b2sums=('e08e27520fb98da79cd4910a51761ac4a844f3631822e172a7b5b4f657cb5090addeb6dba157305852b5546edfc0ba5d81c7ad16712aa3368a7ab4e28214fa31')

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
