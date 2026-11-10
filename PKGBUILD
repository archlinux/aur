# Maintainer: Aditya Gupta <mail@adityagupta.dev>
#
# One build, two packages (Go only, so there is no Rust, Node or WebKit in the build):
#   protd  the daemon and its systemd user unit
#   prot   the CLI and MCP server (depends on protd)
#
# The desktop app is a separate package, prot-desktop, so that installing prot does not compile it.

pkgbase=prot
pkgname=(protd prot)
pkgver=0.2.1
pkgrel=1
pkgdesc="Your development servers, under control"
arch=(x86_64 aarch64)
url="https://github.com/terastal-hq/prot"
license=(MIT)
makedepends=(go)
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        protd.service
        protd.install)
# The first checksum is filled in by the publish workflow (or `updpkgsums`) once the v$pkgver tag exists on GitHub.
sha256sums=('8681ab4cacde3a8cd919f8c11ae918a104bfd04a9b34a189c1de2b8eceb35fae'
            '92f46be2caef8d87f8b8292d71d621c99a3ace4434d4fdedb0b4610c0a5d042f'
            '0ac18ee1337c27194d3d61396c31b087f53d5d6fc42e7823817bfeb84c123568')
options=(!lto !debug)

_srcdir() { echo "$srcdir/$pkgbase-$pkgver"; }

prepare() {
  cd "$(_srcdir)"
  export GOFLAGS="-modcacherw"
  go mod download
}

build() {
  cd "$(_srcdir)"
  export CGO_ENABLED=0
  export GOFLAGS="-trimpath -mod=readonly -modcacherw"
  local ldflags="-s -w -X github.com/terastal-hq/prot/internal/daemon.Version=$pkgver"
  mkdir -p build
  go build -ldflags "$ldflags" -o build/ ./cmd/prot ./cmd/protd
}

package_protd() {
  pkgdesc="prot daemon: process supervisor, .localhost reverse proxy and API"
  install=protd.install

  cd "$(_srcdir)"
  install -Dm755 build/protd "$pkgdir/usr/bin/protd"
  install -Dm644 "$srcdir/protd.service" "$pkgdir/usr/lib/systemd/user/protd.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_prot() {
  pkgdesc="prot command line interface and MCP server"
  depends=(protd)

  cd "$(_srcdir)"
  install -Dm755 build/prot "$pkgdir/usr/bin/prot"
  install -Dm644 completions/prot.bash "$pkgdir/usr/share/bash-completion/completions/prot"
  install -Dm644 completions/_prot "$pkgdir/usr/share/zsh/site-functions/_prot"
  install -Dm644 completions/prot.fish "$pkgdir/usr/share/fish/vendor_completions.d/prot.fish"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
