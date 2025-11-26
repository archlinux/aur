# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=apollo-rover
_pkg=rover
pkgver=0.36.2
pkgrel=1
pkgdesc="CLI for Apollo's suite of GraphQL developer productivity tools"
arch=('x86_64')
url='https://github.com/apollographql/rover'
license=('MIT')
depends=('gcc-libs' 'zlib')
makedepends=('cargo')
replaces=('apollo-rover-fed2')
options=('!lto')
install=rover.install
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b176e9d137dec3a80495efecf3c1227bc38ce1c44f7a018748858f491bb4a010')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$_pkg-$pkgver"
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$_pkg-$pkgver"
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$_pkg-$pkgver"
    # TODO: remove line 38 next update
    cargo test --frozen --all-features --workspace \
        -- --skip shared::git_context::tests::it_can_create_git_context_commit_author_remote_url
}

package() {
    cd "$_pkg-$pkgver"
    install -Dv "target/release/$_pkg" -t "$pkgdir/usr/bin/"
    install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
