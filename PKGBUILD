# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=hashcards
pkgver=0.5.0
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
_commit=24cb76c
source=("$pkgname::git+$url#commit=$_commit"
        eudoxia0.keys)
sha256sums=('6d0ef3360e19fe7437ffdb010a5f6aac89b5c043c89333ca8ec210a31903e977'
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
    export AWS_LC_SYS_NO_JITTER_ENTROPY=1
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
