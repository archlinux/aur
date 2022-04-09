# Maintainer: Wtz_LASR <wtz_lasr at outlook dot com>
pkgname=v2ray-rust-git
_pkgname=v2ray-rust
pkgver=r62.22ae05d
pkgrel=2
pkgdesc="An Opinionated Lightweight Implementation of V2Ray, in Rust Programming Language"
arch=('x86_64')
url="https://github.com/Qv2ray/v2ray-rust"
license=('AGPL3')
makedepends=('git' 'cargo' 'clang' 'cmake')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/Qv2ray/v2ray-rust.git' 'v2ray-rust.service' 'v2ray-rust@.service')
b2sums=('SKIP' '1c5e31a6e2ca1b29d269b1b3fc6e8d8b3054b40676be767e6d57460faefa7335d3c1f4cf74255ab341c34322d033107ab16308957fa4c107225e5126698db793' 'f4f4ac0bd58b66865d09ca85034341aa93c0f8d86714f6befd7b35a637d76bff0b240191225c605f2363097487b2958b2fb8262900d40ffc2931a61e3feb45ca')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
	cd "$srcdir/$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
	install -Dm644 "v2ray-rust.service" -t "$pkgdir/usr/lib/systemd/system/"
	install -Dm644 "v2ray-rust@.service" -t "$pkgdir/usr/lib/systemd/system/"
	cd "$srcdir/$_pkgname"
	install -Dm755 "target/release/$_pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 "test_config.toml" "$pkgdir/etc/v2ray-rust/config.toml"
}
