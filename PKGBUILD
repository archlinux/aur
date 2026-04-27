# Maintainer: João Costa <joaocosta.work@posteo.net>
pkgname=snip-llm-proxy-git
pkgver=0.15.0.r11.g70dc62a
pkgrel=1
pkgdesc="CLI proxy that reduces LLM token usage with declarative YAML filters for AI coding assistants (git master)"
arch=('x86_64' 'aarch64')
url='https://github.com/edouard-claude/snip'
license=('MIT')
makedepends=('git' 'go')
provides=('snip-llm-proxy')
conflicts=('snip-llm-proxy')
source=("$pkgname::git+https://github.com/edouard-claude/snip.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname" || exit 1
  (
    set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cd "$srcdir/$pkgname" || exit 1
  export CGO_ENABLED=0
  _version=$(git describe --tags --always 2>/dev/null | sed 's/^v//')
  go build -trimpath -ldflags="-s -w -X 'github.com/edouard-claude/snip/internal/cli.version=$_version'" -o snip ./cmd/snip
}

package() {
  cd "$srcdir/$pkgname" || exit 1
  install -Dm755 snip "$pkgdir/usr/bin/snip"
}
