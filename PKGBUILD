# Maintainer: Maxr1998 <aur@maxr1998.de>
_pkgname=alistral
pkgname=alistral-git
pkgver=1505.a6a21cd6
pkgrel=1
pkgdesc="Power tools for Listenbrainz"
arch=('x86_64')
url="https://github.com/RustyNova016/Alistral"
license=('MIT')
depends=('glibc' 'gcc-libs' 'openssl' 'bzip2' 'xz')
makedepends=('cargo')
provides=('alistral')
conflicts=('alistral')
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export SQLX_OFFLINE=true
    CFLAGS+=" -ffat-lto-objects"
    cargo build --frozen --release --features full
}

check() {
    cd "$_pkgname"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --features full
}

package() {
    cd "$_pkgname"

    install -Dm755 "target/release/$_pkgname" -T "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$_pkgname/"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname/"

    # Generate completions
    for comp in bash fish zsh; do
        "$pkgdir/usr/bin/$_pkgname" --generate $comp > $comp
    done

    install -Dm644 bash -T "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
    install -Dm644 fish -T "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
    install -Dm644 zsh  -T "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}
