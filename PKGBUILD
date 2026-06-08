# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=hashcards
pkgver=0.3.1
pkgrel=1
pkgdesc="Plain text-based spaced repetition system for flashcards"
arch=(x86_64)
url="https://github.com/eudoxia0/hashcards"
license=(Apache-2.0)
depends=(libgcc_s.so)
makedepends=(cargo git openssh)
options=(!lto)
_commit=423519f
source=("$pkgname::git+$url#commit=$_commit"
        eudoxia0.keys)
sha256sums=('c97181770fc354dd553c20d87e3212125423bb74c1011c6e2c9f8b1d75711e79'
            '0304ac02afcca0315861846a780945e8ef329553b480297d529768de0d172cda')

prepare() {
    ## TODO: remove once implemented in verify()
    git -C "$pkgname" -c gpg.ssh.allowedSignersFile="$srcdir/eudoxia0.keys" verify-commit "$_commit"

    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname"
    ## TODO: remove after (0.3.0)
    # cargo update
    cargo fetch --locked --target host-tuple
    ## TODO: figure out how to build against system katex
    make vendor/katex
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname"
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname"
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname"
    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
