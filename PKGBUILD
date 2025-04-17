# Maintainer: Kimiblock Moe

pkgname=tuwunel-git
pkgdesc="successor to conduwuit with stable governance"
url="https://github.com/matrix-construct/tuwunel"
license=("Apache-2.0")
arch=("x86_64")
pkgver=0.5.0.5108.geb2949d6
pkgrel=1
makedepends=("rust" "cargo" "git" "clang" "linux-api-headers" "linux-headers" "llvm" "libc++" "autoconf")
depends=("gcc-libs" "glibc" "liburing")
source=("git+https://github.com/matrix-construct/tuwunel.git")
sha256sums=(SKIP)
provides=("conduwuit" "tuwunel")
conflicts=("conduwuit")
options=(!lto)
backup=("etc/tuwunel/tuwunel.toml")

function pkgver() {
	cd tuwunel
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

function prepare() {
	cd "${srcdir}/tuwunel"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
	export CONDUWUIT_VERSION_EXTRA=$(git rev-parse --short HEAD)
}

function build() {
	cd "${srcdir}/tuwunel"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features --locked
}

function check() {
	cd "${srcdir}/tuwunel"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --locked --all-features
}

function package() {
	install -Dm755 "${srcdir}/tuwunel/target/release/conduwuit" "${pkgdir}/usr/bin/conduwuit"
	install -Dm644 "${srcdir}/tuwunel/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/tuwunel/conduwuit-example.toml" "${pkgdir}/etc/tuwunel/tuwunel.toml"
	install -Dm644 "${srcdir}/tuwunel/arch/conduwuit.service" "${pkgdir}/usr/lib/systemd/system/tuwunel.service"
}
