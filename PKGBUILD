# Maintainer: GreyXor <greyxor@protonmail.com>

pkgname=pam-any-git
pkgver=r12.e776877
pkgrel=1
pkgdesc='A PAM module that runs multiple other PAM modules in parallel, succeeding as long as one of them succeeds (git development version)'
arch=('i686' 'x86_64')
url="https://github.com/ChocolateLoverRaj/pam-any"
depends=('glibc' 'gcc-libs' 'pam')
makedepends=('cargo' 'git' 'clang')
source=("${pkgname}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm0755 -t "$pkgdir/usr/lib/security" "target/release/pam_any.so"
}
