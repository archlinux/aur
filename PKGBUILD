# Maintainer: Pasqual Troncone <pasqualtroncone at gmail dot com>

pkgname=ai-jail
pkgver=0.8.3
pkgrel=1
pkgdesc='Sandbox for AI coding agents (bubblewrap on Linux, sandbox-exec on macOS)'
arch=('x86_64')
url='https://github.com/akitaonrails/ai-jail'
license=('GPL-3.0-only')
depends=('bubblewrap' 'glibc' 'gcc-libs')
optdepends=(
    'mise: language version management inside the sandbox'
    'docker: Docker socket passthrough'
)
makedepends=('cargo')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/akitaonrails/ai-jail/archive/refs/tags/v$pkgver.tar.gz"
    'fix-flaky-test-new-session.patch'
    'fix-sandbox-escape-probe.patch'
)
b2sums=(
    '0b5d9355dd6068438fed6f2bd3254eb5343f6399e1b8e69d8072c7c56fd41442182efcb06b632fb3030b7edef3bc284d1c8b25ed5266ab684a964be448c57694'
    '7bc2029b884b9ccd9b4225b32381f507c4a84047431c20e925a3bd8de36e301594522d017a58412490e81eada7adbdc7e21883fcfffd0b00658221721d92397d'
    '0f4f068d15c101e091d6d37d82a73fd170df38ad0ac6cb9b3abf1fbb691602bb4e596cfaf45bd5dfb4251f42cd8b1d38c38d95adf58283701942ecd7d68aa04e'
)

prepare() {
    cd "$pkgname-$pkgver"
    # Upstream test dry_run_contains_isolation_flags asserts --new-session
    # unconditionally, but the flag is environment-dependent. Patch makes it
    # match should_use_new_session() so the test is deterministic.
    patch -p1 -i "$srcdir/fix-flaky-test-new-session.patch"
    # Upstream bwrap_available() probe in sandbox_escape.rs omits --proc, so
    # tests fail inside nspawn (e.g. pkgctl build) where proc mounts aren't
    # permitted. Patch adds --proc to the probe so tests skip cleanly.
    patch -p1 -i "$srcdir/fix-sandbox-escape-probe.patch"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
