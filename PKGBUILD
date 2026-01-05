# Maintainer: Maxr1998 <aur@maxr1998.de>
pkgname=alistral
_reponame=Alistral
pkgver=0.6.5
pkgrel=1
pkgdesc="Power tools for Listenbrainz"
arch=('x86_64')
url="https://github.com/RustyNova016/$_reponame"
license=('MIT')
depends=('glibc' 'gcc-libs' 'openssl' 'bzip2' 'xz')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RustyNova016/$_reponame/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('5d250d09387b650a27a67612c2b358885d1d54754ffd111a9d9dbe2fe572cb15a6c05548b3b8484d84172b2218623c38b86bb543cf3179c7a4bc44b80109f3b2')

prepare() {
    cd "$_reponame-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_reponame-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export SQLX_OFFLINE=true
    CFLAGS+=" -ffat-lto-objects"
    cargo build --frozen --release --features full
}

check() {
    cd "$_reponame-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --features full
}

package() {
    cd "$_reponame-$pkgver"

    install -Dm755 "target/release/$pkgname" -T "$pkgdir/usr/bin/$pkgname"

    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"

    # Generate completions
    for comp in bash fish zsh; do
        "$pkgdir/usr/bin/$pkgname" --generate $comp > $comp
    done

    install -Dm644 bash -T "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm644 fish -T "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
    install -Dm644 zsh  -T "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
