# Maintainer: Trevor Tilby <trevor.tilby@gmail.com>
pkgname='ds3os-loader-rs-git'
pkgver=r12.d83b7a1
pkgrel=1
pkgdesc="Loader for the Dark Souls 3 Open Server"
arch=('x86_64')
url="https://github.com/clague/ds3os-loader-rs"
license=('unknown')
depends=('openssl' 'fontconfig' 'freetype2' 'gcc-libs' 'glibc'
		 'expat' 'zlib' 'bzip2' 'libpng' 'harfbuzz' 'brotli')
makedepends=('cargo-nightly' 'git')
source=("$pkgname::git+https://github.com/clague/ds3os-loader-rs"
		"iced::git+https://github.com/iced-rs/iced"
		"iced_aw::git+https://github.com/clague/iced_aw")
md5sums=("SKIP"
		 "SKIP"
		 "SKIP")

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=nightly
	cargo update
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=nightly
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd "$pkgname"
	install -Dm755 "target/release/ds3os-loader" "$pkgdir/usr/bin/ds3os-loader"
	install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname"
}
