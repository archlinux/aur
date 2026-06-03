# Maintainer: Katestheimeno <katestheimeno@gmail.com>
pkgname=wj
pkgver=0.9.0
pkgrel=1
pkgdesc="Cross-project daily task & time tracker via an append-only TSV event log"
# The CLI is pure bash (arch-independent), but the package also ships the
# compiled `wj-tui` front-end, so it is architecture-specific.
arch=('x86_64' 'aarch64')
url="https://github.com/Katestheimeno/wj"
license=('Apache-2.0')
depends=('bash' 'gawk' 'git' 'sed' 'util-linux' 'coreutils')
# go is build-time only: wj-tui is statically linked and needs no Go at runtime.
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Placeholder: after the v$pkgver tag is pushed, run `updpkgsums` to pin the
# real checksum (needs pacman-contrib). SKIP lets you build/test before then.
sha256sums=('a5d2bdf433af10a7fbb25fa8a599a114c445420c625e68756d8c79482bc46537')

prepare() {
    # Fetch Go modules here so build() can run without network (clean chroots).
    cd "$srcdir/$pkgname-$pkgver/tui"
    export GOPATH="$srcdir/gopath" GOFLAGS="-mod=readonly -modcacherw"
    go mod download
}

build() {
    cd "$srcdir/$pkgname-$pkgver/tui"
    export CGO_ENABLED=0 GOFLAGS="-mod=readonly -modcacherw"
    export GOPATH="$srcdir/gopath" GOCACHE="$srcdir/gocache"
    go build -trimpath -ldflags="-s -w -X main.version=$pkgver" -o "$srcdir/wj-tui" .
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 wj               "$pkgdir/usr/bin/wj"
    install -Dm755 "$srcdir/wj-tui" "$pkgdir/usr/bin/wj-tui"
    install -Dm644 wj.1             "$pkgdir/usr/share/man/man1/wj.1"
    install -Dm644 LICENSE          "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md        "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Bash completion is fully static, so generate it at build time.
    # zsh users use `eval "$(wj completion zsh)"` (see README) — its output is
    # an eval snippet, not an autoloadable compdef file, so it isn't installed.
    install -Dm644 <(./wj completion bash) \
        "$pkgdir/usr/share/bash-completion/completions/wj"
}
