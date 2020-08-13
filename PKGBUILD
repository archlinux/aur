# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=weechat-matrix-rs-git
pkgver=r206.fcd3da2
pkgrel=1
pkgdesc='Rust rewrite of the Python weechat-matrix script'
arch=('x86_64')
url='https://github.com/poljar/weechat-matrix-rs'
license=('ISC')
depends=('openssl' 'weechat')
makedepends=('git' 'clang' 'llvm' 'rust')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${pkgname%-git}"
	RUSTC_BOOTSTRAP=1 cargo build --release --locked # enable nightly async_closure feature
}

package() {
	cd "${pkgname%-git}"
	install -Dm755 target/release/libmatrix.so "$pkgdir/usr/lib/weechat/plugins/matrix.so"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
