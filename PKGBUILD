# Maintainer: Trevor Tilby <trevor.tilby@gmail.com>
pkgname='ds3os-loader-rs-git'
pkgver=r19.e7b4045
pkgrel=2
pkgdesc="Loader for the Dark Souls 3 Open Server"
arch=('x86_64')
url="https://github.com/clague/ds3os-loader-rs"
license=('unknown')
depends=('openssl' 'fontconfig' 'freetype2' 'gcc-libs' 'glibc'
		 'expat' 'zlib' 'bzip2' 'libpng' 'harfbuzz' 'brotli')
makedepends=('cargo' 'git')
source=("$pkgname::git+https://github.com/clague/ds3os-loader-rs")
md5sums=("SKIP")
provides=("ds3os-loader")
conflicts=("ds3os-loader")

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgname"
	cargo update
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname"
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd "$pkgname"
	install -Dm755 "target/release/ds3os-loader" "$pkgdir/usr/bin/ds3os-loader"
	install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname"
}
