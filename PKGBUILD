# Maintainer: Wtz_LASR <wtz_lasr at outlook dot com>
pkgname=v2ray-rust-git
_pkgname=v2ray-rust
pkgver=r62.22ae05d
pkgrel=1
pkgdesc="An Opinionated Lightweight Implementation of V2Ray, in Rust Programming Language"
arch=('x86_64')
url="https://github.com/Qv2ray/v2ray-rust"
license=('AGPL3')
makedepends=('git' 'cargo' 'clang' 'cmake')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/Qv2ray/v2ray-rust.git' 'v2ray-rust.service' 'v2ray-rust@.service')
b2sums=('SKIP' '54d07250782385804031080b80899d40cc893ad5db6327e571aea610f433b36107ae5a35bcfce285c8fcd4846367b83eb3ec0472b36b24659741fae04ac7a0cd' '753c9dc4c98ce35d982a07b4a1398c8fae037d863714d8eeeda7fda66aab123254a7c0735b21d7f327cf34562b4bee6bd90b4426319a1dc23088a457ba2bb9a4')

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
