# Maintainer: Lionel Fernandes <lsfe87 at gmail dot com>
# Maintainer: Richard Hajek <richard.m.hajek at gmail dot com>
# Contributor: Ben Edwards <aur at artfuldodge dot io>

pkgname=restish
pkgver=2.3.0
pkgrel=1
pkgdesc='A CLI for interacting with REST-ish HTTP APIs'
arch=(x86_64 aarch64)
url='https://rest.sh'
license=(MIT)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::https://github.com/rest-sh/restish/archive/v$pkgver.tar.gz")
sha256sums=('b80dfebc06288d8ce6ca1e83fb1b848e345958001d878220b9fa17ae702a7dc5')

_plugins=(restish-bulk restish-csv restish-mcp)

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
  cd "$pkgname-$pkgver"
  _env
  go mod download
}

build() {
  cd "$pkgname-$pkgver"
  _env

  go build -o build/ \
    -ldflags "-linkmode=external -X github.com/rest-sh/restish/v2/internal/cli.Version=$pkgver" \
    ./cmd/restish "${_plugins[@]/#/./cmd/}"

  ./build/restish shell completion bash > build/restish.bash
  ./build/restish shell completion zsh > build/_restish
  ./build/restish shell completion fish > build/restish.fish
}

check() {
  cd "$pkgname-$pkgver"
  _env
  [[ $(./build/restish --version) == "restish version $pkgver" ]]
  # Tests locate fixtures by source path
  go test -trimpath=false ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/restish "${_plugins[@]/#/build/}" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 build/restish.bash "$pkgdir/usr/share/bash-completion/completions/restish"
  install -Dm644 build/_restish "$pkgdir/usr/share/zsh/site-functions/_restish"
  install -Dm644 build/restish.fish "$pkgdir/usr/share/fish/vendor_completions.d/restish.fish"
}
