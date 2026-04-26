# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=apollo-rover
_pkg=rover
pkgver=0.38.1
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
sha256sums=('d3b27add53fc0d8eedd89ba3a6a0d0dbb1833d268f79c0a81f755c44e7db8735')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$_pkg-$pkgver"
    cargo fetch --locked --target host-tuple
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
    cargo test --frozen --all-features --workspace \
        -- --skip shared::git_context::tests::it_can_create_git_context_commit_author_remote_url \
        --skip introspection_cli_tests
}

package() {
    cd "$_pkg-$pkgver"
    install -Dv "target/release/$_pkg" -t "$pkgdir/usr/bin/"
    install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
