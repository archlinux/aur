# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>
pkgname=posthog-cli
pkgver=0.19.4
pkgrel=1
_commit=73e19bb6ba376b0ba0a72e3facb33d456f80f982
pkgdesc="The command line interface for PostHog"
arch=('x86_64' 'aarch64')
url="https://github.com/PostHog/posthog"
license=('MIT')
depends=('glibc' 'gcc-libs' 'zlib')
conflicts=('posthog-cli-bin')
makedepends=('cargo' 'nodejs>=26' 'nodejs<27' 'pnpm')
optdepends=('nodejs: required for the posthog-cli api command')
options=('!lto')
source=("$pkgname-v$pkgver-$_commit.tar.gz::https://github.com/PostHog/posthog/archive/$_commit.tar.gz")
sha256sums=('fdb4091afd01bee74ad5dd44347487c2e2796856e6ea66122d071162e7709139')

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
