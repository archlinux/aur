# Maintainer: 5unekku <jimmy.bungalo8@gmail.com>
pkgname=toss-musl-git
pkgver=0000000
pkgrel=1
pkgdesc="XDG-compliant rm replacement that trashes instead of deletes (static musl build)"
arch=('x86_64')
url="https://codeberg.org/5unekku/toss"
license=('Apache-2.0')
makedepends=('cargo' 'musl')
provides=('toss')
conflicts=('toss-git')
source=("$pkgname::git+https://codeberg.org/5unekku/toss.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 2>/dev/null \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
        || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$pkgname"
    rustup target add x86_64-unknown-linux-musl 2>/dev/null || true
    cargo fetch --locked --target x86_64-unknown-linux-musl
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CARGO_TARGET_X86_64_UNKNOWN_LINUX_MUSL_LINKER=musl-gcc
    cargo build --frozen --release --target x86_64-unknown-linux-musl
}

package() {
    cd "$pkgname"
    install -Dm755 target/x86_64-unknown-linux-musl/release/toss "$pkgdir/usr/bin/toss"
    install -Dm644 completions/_toss "$pkgdir/usr/share/zsh/site-functions/_toss"
    install -Dm644 completions/toss.fish "$pkgdir/usr/share/fish/vendor_completions.d/toss.fish"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
