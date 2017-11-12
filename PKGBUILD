# Maintainer: Versus Void <chaoskeeper@mail.ru>
pkgname=sccache-git
pkgver=r412.cbb72b8
pkgrel=1
pkgdesc="ccache-like tool. Wraps compiler and avoids compilation when possible. Supports rustc"
arch=(i686 x86_64)
url="https://github.com/mozilla/sccache"
license=('Apache')
makedepends=('git' 'rust')
install=sccache.install
source=('git+https://github.com/mozilla/sccache/'
	'color.patch'
	'cross-package-cache.patch')
sha256sums=('SKIP'
	'82ed21e16bb38274bdc4f5ae2e3941c487ddf1859de4984a2610a065928806f5'
	'43a7c03ddc6c9a957ad330de2a938aebafebbae350869ad76302ebf8e0719a5d')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git apply "$srcdir/color.patch"
	git apply "$srcdir/cross-package-cache.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cargo build --release
}

check() {
	cd "$srcdir/${pkgname%-git}"
	cargo test --release
}

package() {
	cd "$srcdir/${pkgname%-git}"
	cargo install --root "$pkgdir/usr"
	rm  -f "$pkgdir/usr/.crates.toml"
}
