# Maintainer: souk4711
#
# shellcheck disable=SC2034,SC2148,SC2154,SC2164

pkgname=hakoniwa
pkgver=1.8.1
pkgrel=1
pkgdesc='Process isolation for Linux using namespaces, resource limits, cgroups, landlock and seccomp.'
arch=('x86_64')
url='https://github.com/souk4711/hakoniwa'
license=('GPL-3.0-only')
depends=("libgcc" "libseccomp" "passt" "shadow")
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/souk4711/hakoniwa/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e5be70a7bf4ab783cfd7b36c2c523b5e16a0bac396b7ac7b653c1e656cb84dfc')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    RUSTFLAGS="--remap-path-prefix=$srcdir=/build/" \
        cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 "target/release/hakoniwa" "$pkgdir/usr/bin/hakoniwa"
    install -Dm0644 etc/bash/completions/hakoniwa "$pkgdir/usr/share/bash-completion/completions/hakoniwa"
    install -Dm0644 etc/zsh/site-functions/_hakoniwa "$pkgdir/usr/share/zsh/site-functions/_hakoniwa"
    install -Dm0644 etc/fish/vendor_completions.d/hakoniwa.fish "$pkgdir/usr/share/fish/vendor_completions.d/hakoniwa.fish"
}
