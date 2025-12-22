# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>
# Contributor: Torsten Keßler <tpkessler at archlinux dot org>

pkgname=complgen
pkgver=0.5.0
pkgrel=1
pkgdesc="Generate bash/fish/zsh completions from a single declarative grammar"
arch=('x86_64')
url="https://github.com/adaszko/complgen"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('22c65424f5b52d8b04d24be512c77dcabb13f660381fb066a407f69e5d47090712fa9b8b09627527997c3c14496b721601c07911339bb7e963d0a34bb59b0bb0')

prepare() {
	cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc --print host-tuple)"
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

	install -Dm0755 "target/release/complgen" -t "$pkgdir/usr/bin"
}
