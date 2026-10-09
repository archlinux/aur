# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=apollo-rover
_pkg=rover
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI for Apollo's suite of GraphQL developer productivity tools"
arch=(x86_64)
url='https://github.com/apollographql/rover'
license=(MIT)
depends=(libgcc libgcc_s.so
         zlib libz.so)
makedepends=(cargo)
replaces=(apollo-rover-fed2)
options=(!lto)
install=rover.install
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('08b06897f6a6a85490fc97dc7811aac17e2da72d44c09b5f5d07cb443a4d9102')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$_pkg-$pkgver"
    cargo fetch --locked --target host-tuple
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export AWS_LC_SYS_NO_JITTER_ENTROPY=1
    cd "$_pkg-$pkgver"
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$_pkg-$pkgver"
    cargo test --frozen --all-features --workspace -- \
        --skip introspection_cli_tests \
        --skip profile::sensitive::tests::load_warns_via_stderr_when_legacy_file_cannot_be_removed_after_migration \
        --skip shared::git_context::tests::it_can_create_git_context_commit_author_remote_url \
        --skip it_migrates_a_legacy_plaintext_credential \
        --skip command::dev::tests::supergraph_output_defaults_to_none \
        --skip commands::changeset::tests
}

package() {
    cd "$_pkg-$pkgver"
    install -Dv "target/release/$_pkg" -t "$pkgdir/usr/bin/"
    install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
