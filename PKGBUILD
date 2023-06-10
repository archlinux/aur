# Maintainer: Marco Radocchia <marco.radocchia@outlook.com>
pkgname="schoenerd"
pkgver="0.1.0"
pkgrel=1
pkgdesc="Schoener's D index calculator for niche overlap."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/marcoradocchia/schoenerd"
license=('GPL3')
makedepends=('git' 'cargo')
checkdepends=('cargo')
provides=('schoenerd')
conflicts=('schoenerd')
source=("https://github.com/marcoradocchia/schoenerd/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4c7ded4d035c74b63b1b98f1f82d06fc9da1cbd26035d5a6ffba8f51892c949c')

prepare() {
	cd "${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

# check() {
# 	cd "${pkgname}"
# 	export RUSTUP_TOOLCHAIN=stable
# 	cargo test --frozen --all-features
# }

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 "./target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"

	install -Dm644 ./target/release/build/schoenerd-*/out/completions/_"${pkgname}" "$pkgdir/usr/share/zsh/site-functions/_${pkgname}"
	install -Dm644 ./target/release/build/schoenerd-*/out/completions/"${pkgname}".bash "$pkgdir/usr/share/bash-completion/completions/${pkgname}.bash"
	install -Dm644 ./target/release/build/schoenerd-*/out/completions/"${pkgname}".fish "$pkgdir/usr/share/fish/vendor_completions.d/${pkgname}.fish"

	install -Dm644 ./target/release/build/schoenerd-*/out/man/"${pkgname}".1 "$pkgdir/usr/share/man/man1/$pkgname.1"
	install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
