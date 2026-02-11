# Maintainer: Antoine Gaudreau Simard <antoinegs at gmail dot com>

pkgname=tidydots-git
pkgver=r0.0000000
pkgrel=1
pkgdesc="Cross-platform dotfile manager using symlinks, templates, and package management from a single YAML config"
arch=('x86_64')
url='https://github.com/AntoineGS/tidydots'
license=('MIT')
makedepends=('go' 'git')
provides=('tidydots')
conflicts=('tidydots')
depends=('glibc')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build -o tidydots ./cmd/tidydots

  # Generate shell completions
  ./tidydots completion bash > tidydots.bash
  ./tidydots completion zsh > tidydots.zsh
  ./tidydots completion fish > tidydots.fish
}

package() {
  cd "${pkgname}"

  install -Dm755 tidydots "${pkgdir}/usr/bin/tidydots"

  install -Dm644 tidydots.bash "${pkgdir}/usr/share/bash-completion/completions/tidydots"
  install -Dm644 tidydots.zsh "${pkgdir}/usr/share/zsh/site-functions/_tidydots"
  install -Dm644 tidydots.fish "${pkgdir}/usr/share/fish/vendor_completions.d/tidydots.fish"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
