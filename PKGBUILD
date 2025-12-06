# Maintainer: Maxr1998 <aur@maxr1998.de>
pkgname=alistral
_reponame=Alistral
pkgver=0.6.3
pkgrel=2
pkgdesc="Power tools for Listenbrainz"
arch=('x86_64')
url="https://github.com/RustyNova016/$_reponame"
license=('MIT')
depends=('glibc' 'gcc-libs' 'openssl' 'bzip2' 'xz')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RustyNova016/$_reponame/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('7735e1a7355a7900e302bc0152d99efc9abac511b1c341a44329976dc17a72b4aed82bffe5f660a6af1d3caa0f8dcaac9b5cccb03efe8f2e9080bc88c017026b')

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
    cargo build --frozen --release --all-features --no-default-features
}

check() {
    cd "$_reponame-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
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
