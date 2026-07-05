# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=opencode-pty
_pkgname=opencode-pty
pkgver=0.3.6
pkgrel=1
pkgdesc="OpenCode plugin for interactive PTY management - run background processes, send input, read output with regex filtering"
arch=('x86_64' 'aarch64')
url="https://github.com/shekohex/opencode-pty"
license=('MIT')
depends=('opencode')
makedepends=('npm')
options=('!strip' '!debug')
install=$pkgname.install

source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
sha256sums=('3c4c6714771556983d3d5ccc2bcb35687c2a2c0adbbf9bed9d67340f8e8f3337')

latestver() {
    curl -fsSL "https://registry.npmjs.org/$_pkgname/latest" | jq -r '.version'
}

package() {
    mkdir -p "$srcdir/npm-extract"
    tar -xzf "$srcdir/$pkgname-$pkgver.tgz" -C "$srcdir/npm-extract" --strip-components=1

    cd "$srcdir/npm-extract"
    npm install --omit=dev --omit=peer

    case "$CARCH" in
        x86_64) rm -f node_modules/bun-pty/rust-pty/target/release/librust_pty_arm64.so ;;
        aarch64) rm -f node_modules/bun-pty/rust-pty/target/release/librust_pty.so ;;
    esac

    install -d "$pkgdir/usr/lib/opencode/plugins/$pkgname"
    cp -r . "$pkgdir/usr/lib/opencode/plugins/$pkgname/"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
