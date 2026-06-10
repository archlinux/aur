# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>
pkgname=posthog-cli
pkgver=0.7.22
pkgrel=1
pkgdesc="The command line interface for PostHog"
arch=('x86_64' 'aarch64')
url="https://github.com/PostHog/posthog"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/PostHog/posthog/archive/refs/tags/posthog-cli%2Fv$pkgver.tar.gz")
sha256sums=('f7dbee225545ebec7167e32f70a03bca3833f8a6c32f4cdbfe0d268e001aba78')

_srcdir="posthog-posthog-cli-v$pkgver"

prepare() {
    cd "$srcdir/$_srcdir/cli"
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
