# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>
pkgname=posthog-cli
pkgver=0.18.10
pkgrel=1
_commit=e519ba6304903b31e5e3d74c6d1a5fe9a96c745e
pkgdesc="The command line interface for PostHog"
arch=('x86_64' 'aarch64')
url="https://github.com/PostHog/posthog"
license=('MIT')
depends=('glibc' 'gcc-libs' 'zlib')
conflicts=('posthog-cli-bin')
makedepends=('cargo' 'nodejs-lts-krypton' 'pnpm')
optdepends=('nodejs: required for the posthog-cli api command')
options=('!lto')
source=("$pkgname-v$pkgver-$_commit.tar.gz::https://github.com/PostHog/posthog/archive/$_commit.tar.gz")
sha256sums=('1ab2ebb1a112451bab491f1a29fd177943ac90ea7004d9599c812e30f57cda6e')

_srcdir="posthog-$_commit"

prepare() {
    cd "$srcdir/$_srcdir"
    pnpm install --frozen-lockfile --ignore-scripts --filter '@posthog/mcp...'
    pnpm --dir services/mcp run build:cli:release

    cd cli
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_HOME="$srcdir/.cargo-home"
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    cd "$srcdir/$_srcdir/cli"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_HOME="$srcdir/.cargo-home"
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$srcdir/$_srcdir/cli"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_HOME="$srcdir/.cargo-home"
    export CARGO_TARGET_DIR=target
    cargo test --frozen
}

package() {
    cd "$srcdir/$_srcdir/cli"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/$_srcdir/LICENSE"
}
