# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=hashcards
pkgver=0.4.0
pkgrel=1
pkgdesc="Plain text-based spaced repetition system for flashcards"
arch=(x86_64)
url="https://github.com/eudoxia0/hashcards"
license=(Apache-2.0)
depends=(
    libgcc  libgcc_s.so
    sqlite  libsqlite3.so
)
makedepends=(cargo git openssh)
options=(!lto)
_commit=2699292
source=("$pkgname::git+$url#commit=$_commit"
        eudoxia0.keys)
sha256sums=('f8651760ddc953c80c0235923ebb04fa48ed1cad70ea557e60ddc51531c4f850'
            '0304ac02afcca0315861846a780945e8ef329553b480297d529768de0d172cda')

prepare() {
    ## TODO: remove once implemented in verify()
    git -C "$pkgname" -c gpg.ssh.allowedSignersFile="$srcdir/eudoxia0.keys" verify-commit "$_commit"

    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname"
    cargo fetch --locked --target host-tuple
    ## TODO: figure out how to build against system katex
    make vendor/katex
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
    cd "$pkgname"
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
    cd "$pkgname"
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname"
    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}
