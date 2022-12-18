# Maintainer: Trevor Tilby <trevor dot tilby at gmail dot com>
pkgname='baseconverter-git'
pkgver=r14.78412e7
pkgrel=1
pkgdesc="command line tool to convert numbers between bases"
arch=('x86_64')
url="https://github.com/cndofx/baseconverter"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/cndofx/baseconverter")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-git}"
	install -Dm644 -t "$pkgdir/usr/share/licenses/${pkgname%-git}/" "LICENSE"
}
