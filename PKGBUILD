# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=amdgpud-git
_name=${pkgname%-git}
pkgver=1.0.6.r2.g0c93053
pkgrel=1
pkgdesc="Fan control service for AMD GPUs"
arch=('x86_64')
url="https://github.com/eraden/amdgpud"
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=("$_name")
conflicts=("$_name")
backup=("etc/$_name/config.toml")
source=("$pkgname::git+$url?signed"
        'config.toml')
sha256sums=('SKIP'
            '708070794d89e86d307fd17009e0410adf49adc471cfcde0fdec1f217c85f0de')
validpgpkeys=('0768AEEA335417256AEEA0910012845A89C7352B') ## Adrian Wozniak

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	cd "$pkgname"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$pkgname"
	cargo build --release --frozen --all-features --target="$CARCH-unknown-linux-gnu"
}

check() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$pkgname"
	cargo test --frozen --all-features --target="$CARCH-unknown-linux-gnu"
}

package() {
	cd "$pkgname"
	find "target/$CARCH-unknown-linux-gnu/release/" \
		-maxdepth 1 \
		-executable \
		-type f \
		-exec install -D -t "$pkgdir/usr/bin/" '{}' \+
	find services \
		-maxdepth 1 \
		-name '*.service' \
		-type f \
		-exec install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" '{}' \+
	install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 "$srcdir/config.toml" -t "$pkgdir/etc/$_name/"
}
