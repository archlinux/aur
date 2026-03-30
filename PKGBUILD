# Maintainer: Sungjoon Moon <sumoon at seoulsaram dot org>

pkgname=hakoniwa
pkgver=1.3.2
pkgrel=1
pkgdesc='Process isolation for Linux using namespaces, resource limits, cgroups, landlock and seccomp'
arch=('x86_64')
url='https://github.com/souk4711/hakoniwa'
license=('GPL-3.0-only' 'LGPL-3.0-only')
depends=('libgcc' 'libseccomp' 'passt')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/souk4711/hakoniwa/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1d1820905e23dd490be0e2369c6cec965bb07741dc45f3de77841b7a384a4177')

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

    install -Dm0644 hakoniwa-cli/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-CLI"
    install -Dm0644 hakoniwa/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-LIB"

    install -Dm0644 etc/bash/completions/hakoniwa "$pkgdir/usr/share/bash-completion/completions/hakoniwa"
    install -Dm0644 etc/zsh/site-functions/_hakoniwa "$pkgdir/usr/share/zsh/site-functions/_hakoniwa"
    install -Dm0644 etc/fish/vendor_completions.d/hakoniwa.fish "$pkgdir/usr/share/fish/vendor_completions.d/hakoniwa.fish"
}
