# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: spikecodes <19519553+spikecodes@users.noreply.github.com>

pkgname=libreddit
pkgver=0.30.1
_commit=f62f7bf
pkgrel=1
pkgdesc='Alternative private front-end to Reddit'
arch=('x86_64')
url='https://github.com/spikecodes/libreddit'
license=('AGPL3')
depends=('gcc-libs')
makedepends=('git' 'cargo')
backup=('etc/libreddit.conf')
options=('!lto')
source=("$pkgname::git+$url#commit=$_commit?signed")
sha256sums=('SKIP')
validpgpkeys=(
	'AD4B24F40D358202591EE1F4004CECFF9B463BCB'
	'5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23' ## spikecodes
	'589E8EF6FA64265B6636C313C82492E4FF813823') ## Daniel Valentine

prepare() {
	cd "$pkgname"
	cargo update
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$pkgname"
	cargo build --release --frozen --all-features
}

check() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$pkgname"
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname"
	install -Dv target/release/libreddit -t "$pkgdir/usr/bin/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dvm644 contrib/libreddit.service -t "$pkgdir/usr/lib/systemd/system/"
	install -Dvm644 contrib/libreddit.conf -t "$pkgdir/etc/"
}
