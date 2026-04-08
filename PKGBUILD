# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=wtp
pkgver=2.10.3
pkgrel=1
pkgdesc="A powerful Git worktree CLI tool with automated setup, branch tracking, and smart navigation"
arch=(x86_64)
url="https://github.com/satococoa/wtp"
license=('MIT')
depends=()
makedepends=('go')
source=("https://github.com/satococoa/wtp/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cd3f0811214aa0544117bbf5a53646d083c7acc0ec118fd90ec3245c9b178f0a')

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}"
  go mod download -modcacherw
  mkdir -p build
}

build() {
  cd "${pkgname}-${pkgver}"
  export APP_LDFLAGS="-s -w -X main.version=${pkgver}"
  export GOPATH="${srcdir}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -ldflags="${APP_LDFLAGS}" -o build ./cmd/...

  # Build shell integration scripts
  for shell in bash zsh fish; do
    ./build/wtp completion $shell > build/wtp_completion.$shell
    ./build/wtp hook $shell > build/wtp_hook.$shell
  done
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 build/${pkgname} "${pkgdir}/usr/bin/${pkgname}"

  # Completion scripts
  install -Dm644 build/wtp_completion.bash "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 build/wtp_completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -Dm644 build/wtp_completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"

  # Hook scripts
  install -Dm644 build/wtp_hook.bash "${pkgdir}/usr/share/${pkgname}/${pkgname}_hook.bash"
  install -Dm644 build/wtp_hook.zsh "${pkgdir}/usr/share/${pkgname}/${pkgname}_hook.zsh"
  install -Dm644 build/wtp_hook.fish "${pkgdir}/usr/share/fish/vendor_conf.d/${pkgname}.fish"
}
