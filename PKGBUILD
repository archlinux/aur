# Maintainer: David Birks <david@birks.dev>

pkgname=gastown
pkgver=1.2.1
pkgrel=1
pkgdesc='Multi-agent orchestration system for Claude Code with persistent work tracking'
arch=('x86_64')
url='https://github.com/gastownhall/gastown'
license=('MIT')
provides=('gt')
depends=('git')
makedepends=('go')
optdepends=(
  'beads: For git-backed issue tracking integration'
  'tmux: Recommended for multi-agent sessions'
)
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gastownhall/gastown/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('e0575a0b006f93a089ccd4d301b67edfbed20ea74e41877ad2114e7d21cb14ee760c2f6d90a897d55980d063e938e4b0484c3bce84da2a571e3e7da550c93031')

build() {
  cd "$pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -buildvcs=false -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o gt ./cmd/gt
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
