# Maintainer: Lionel Fernandes <lsfe87 at gmail dot com>
# Maintainer: Richard Hajek <richard.m.hajek at gmail dot com>
# Contributor: Ben Edwards <aur at artfuldodge dot io>

pkgbase=restish
pkgname=(restish restish-bulk restish-csv restish-mcp)
pkgver=2.3.0
pkgrel=1
pkgdesc='A CLI for interacting with REST-ish HTTP APIs'
arch=(x86_64 aarch64)
url='https://rest.sh'
license=(MIT)
depends=(glibc)
makedepends=(go)
source=("$pkgbase-$pkgver.tar.gz::https://github.com/rest-sh/restish/archive/v$pkgver.tar.gz")
sha256sums=('b80dfebc06288d8ce6ca1e83fb1b848e345958001d878220b9fa17ae702a7dc5')

_env() {
  export GOPATH="$srcdir/gopath"
  export GOCACHE="$(go env GOCACHE)"
  export GOTOOLCHAIN=local
  export GOFLAGS="-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  # Keep restish and its tests out of the builder's home; tests expect no $BROWSER
  export HOME="$srcdir/home"
  mkdir -p "$HOME"
  unset XDG_CONFIG_HOME XDG_CACHE_HOME XDG_DATA_HOME BROWSER
}

prepare() {
  cd "$pkgbase-$pkgver"
  _env
  go mod download
}

build() {
  cd "$pkgbase-$pkgver"
  _env

  go build -o build/ \
    -ldflags "-linkmode=external -X github.com/rest-sh/restish/v2/internal/cli.Version=$pkgver" \
    "${pkgname[@]/#/./cmd/}"

  ./build/restish shell completion bash > build/restish.bash
  ./build/restish shell completion zsh > build/_restish
  ./build/restish shell completion fish > build/restish.fish
}

check() {
  cd "$pkgbase-$pkgver"
  _env
  [[ $(./build/restish --version) == "restish version $pkgver" ]]
  # Tests locate fixtures by source path
  go test -trimpath=false ./...
}

_package_plugin() {
  cd "$pkgbase-$pkgver"
  install -Dm755 "build/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_restish() {
  cd "$pkgbase-$pkgver"
  install -Dm755 build/restish -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 build/restish.bash "$pkgdir/usr/share/bash-completion/completions/restish"
  install -Dm644 build/_restish "$pkgdir/usr/share/zsh/site-functions/_restish"
  install -Dm644 build/restish.fish "$pkgdir/usr/share/fish/vendor_completions.d/restish.fish"
}

package_restish-bulk() {
  pkgdesc='Restish plugin for git-like bulk resource management'
  depends=("restish=$pkgver" glibc)
  install=restish-plugin.install
  _package_plugin
}

package_restish-csv() {
  pkgdesc='Restish formatter plugin that renders responses as CSV'
  depends=("restish=$pkgver" glibc)
  install=restish-plugin.install
  _package_plugin
}

package_restish-mcp() {
  pkgdesc='Restish plugin that exposes registered APIs as MCP tools'
  depends=("restish=$pkgver" glibc)
  install=restish-plugin.install
  _package_plugin
}
