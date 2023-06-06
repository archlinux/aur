# Maintainer: Dian M Fay <dian.m.fay@gmail.com>

pkgname=pdot-git
pkgver=0.1.0
pkgrel=1
pkgdesc='Generate dot digraphs based on your PostgreSQL databases'
arch=(x86_64)
url=https://gitlab.com/dmfay/pdot
license=(MPL2)
makedepends=(
	git
	nodejs
	cargo
)
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=(
	"git+https://gitlab.com/dmfay/pdot.git"
	"git+https://github.com/derekStride/tree-sitter-sql"
)
sha256sums=('SKIP' 'SKIP')

prepare() {
	cd "${pkgname%-git}"
	cargo fetch --locked --target x86_64-unknown-linux-gnu

	# prepare tree-sitter-sql
	git submodule init
	git config submodule.tree-sitter-sql.url "$srcdir/tree-sitter-sql"
	git -c protocol.file.allow=always submodule update
	cd "$srcdir/${pkgname%-git}/tree-sitter-sql" && npm i
}

build() {
	cd "${pkgname%-git}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release
}

package() {
	cd "${pkgname%-git}"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-git}"
}
