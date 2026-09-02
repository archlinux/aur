# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>
pkgname=posthog-cli
pkgver=0.16.2
pkgrel=1
pkgdesc="The command line interface for PostHog"
arch=('x86_64' 'aarch64')
url="https://github.com/PostHog/posthog"
license=('MIT')
depends=('glibc' 'gcc-libs' 'zlib')
makedepends=('cargo' 'nodejs>=24' 'pnpm')
optdepends=('nodejs: required for the posthog-cli api command')
options=('!lto')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/PostHog/posthog/archive/refs/tags/posthog-cli%2Fv$pkgver.tar.gz")
sha256sums=('ecd353b428de0786b30abfdfc314acc7a3c73212d11d7780d8b5a7e9d0be15cd')

_srcdir="posthog-posthog-cli-v$pkgver"

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
