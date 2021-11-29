# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=amdgpud
pkgver=1.0.7
_commit=7dcb6e0
pkgrel=1
pkgdesc="Fan control service for AMD GPUs"
arch=('x86_64')
url="https://github.com/eraden/amdgpud"
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
backup=("etc/$pkgname/config.toml")
source=("$pkgname::git+$url#commit=$_commit?signed")
sha256sums=('SKIP')
validpgpkeys=(
	'0768AEEA335417256AEEA0910012845A89C7352B' ## Adrian Wozniak
	'5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23' ## GitHub
)
## use command below to import public key
## curl https://github.com/eraden.gpg | gpg --import

prepare() {
	cd "$pkgname"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$pkgname"
	cargo build --release --frozen --target "$CARCH-unknown-linux-gnu" --all-features
}

check() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$pkgname"
	cargo test --frozen --all-features --target "$CARCH-unknown-linux-gnu"
}

package() {
	cd "$pkgname"
	find "target/$CARCH-unknown-linux-gnu/release/" \
		-maxdepth 1 \
		-executable \
		-type f \
		-exec install -D -t "$pkgdir/usr/bin/" '{}' \+
	install -Dm644 LICENSE.APACHE2.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE.txt"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT.md"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 services/{amdfand,amdvold}.service -t "$pkgdir/usr/lib/systemd/system/"
	install -Dm644 examples/default_config.toml "$pkgdir/etc/$pkgname/config.toml"
}
