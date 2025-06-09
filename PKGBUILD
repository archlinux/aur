# Maintainer: drrossum

pkgname=tuwunel
pkgdesc="Featureful Matrix homeserver"
url="https://github.com/matrix-construct/tuwunel"
license=("Apache-2.0")
arch=("x86_64")
pkgver=1.0.0
pkgrel=1
makedepends=("rust" "cargo" "git" "clang" "linux-api-headers" "linux-headers" "llvm" "libc++" "autoconf")
depends=("gcc-libs" "glibc" "liburing")
source=("git+https://github.com/matrix-construct/tuwunel#tag=v${pkgver}")
sha256sums=('e573534916ba022b8f6b1fc7f47449f20fb8eb0130b505c668752ce7f226bad7')
provides=("tuwunel")
options=(!lto)
backup=("etc/tuwunel/tuwunel.toml")

function prepare() {
	cd "${srcdir}/tuwunel"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
	export CONDUWUIT_VERSION_EXTRA=$(git rev-parse --short HEAD)
}

function build() {
	cd "${srcdir}/tuwunel"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --locked
}

function check() {
	cd "${srcdir}/tuwunel"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --locked
}

function package() {
	install -Dm755 "${srcdir}/tuwunel/target/release/tuwunel" "${pkgdir}/usr/bin/tuwunel"
	install -Dm644 "${srcdir}/tuwunel/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/tuwunel/tuwunel-example.toml" "${pkgdir}/etc/tuwunel/tuwunel.toml"
	install -Dm644 "${srcdir}/tuwunel/arch/tuwunel.service" "${pkgdir}/usr/lib/systemd/system/tuwunel.service"
}
